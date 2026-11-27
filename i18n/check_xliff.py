#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Check the Transitoires XLIFF files against the code. No 4D needed.

    python3 i18n/check_xliff.py            (from the project root)

1. Each Resources/<lang>.lproj/Transitoires.xlf (en, fr, de, it) is well-formed XML
   and valid against the OASIS XLIFF 1.2 strict schema (i18n/xsd/). 4D files carry no
   default namespace, so the check adds urn:oasis:names:tc:xliff:document:1.2 in memory.
2. target-language matches the folder; every trans-unit has a source and a target;
   no duplicate resname; the four files have the same keys; {n} placeholders match;
   FR/DE/IT targets carry a state attribute (except translate="no": CHF, language names);
   the Language menu offers fr, de, it, en and each has its .lproj folder.
3. Every key used by the forms (:xliff:), menus.json and the methods (L10n, L10n_count,
   Localized string, Menu_addItem for the menu bar built by Menu_build) exists in the four files. Common* keys are provided by 4D itself.
4. Literal user texts left in ALERT, CONFIRM, TextLabel, Message, APPEND MENU ITEM are
   listed, apart from the developer methods kept in English.
Exit code 0 when there is no error."""
import json, os, re, sys, glob
from lxml import etree

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
LANGS = ["en", "fr", "de", "it"]
NS = "urn:oasis:names:tc:xliff:document:1.2"
DEV_ONLY = {"UT_assert.4dm", "launch_unitTest.4dm", "AJUI_FloatingLabel_main.4dm", "_days_currentyear.4dm",
            "_days_nextyear.4dm", "_i18n_unitTests.4dm", "UT_assertText.4dm", "zz_test.4dm", "zz_CleanAndGenerateData.4dm", "_codesky_compile.4dm"}
errors, warnings = [], []

def err(m): errors.append(m)

schema = etree.XMLSchema(etree.parse(os.path.join(ROOT, "i18n", "xsd", "xliff-core-1.2-strict.xsd")))

def with_ns(el):
    new = etree.Element("{%s}%s" % (NS, el.tag), {k: v for k, v in el.attrib.items()})
    new.text, new.tail = el.text, el.tail
    for c in el:
        if isinstance(c.tag, str):
            new.append(with_ns(c))
    return new

files = {}
for lang in LANGS:
    p = os.path.join(ROOT, "Resources", lang + ".lproj", "Transitoires.xlf")
    if not os.path.exists(p):
        err("missing " + p); continue
    try:
        doc = etree.parse(p)
    except etree.XMLSyntaxError as e:
        err("%s: not well-formed: %s" % (p, e)); continue
    root = doc.getroot()
    if root.tag != "xliff" or root.get("version") != "1.2":
        err("%s: root must be <xliff version=\"1.2\">" % lang)
    if not schema.validate(etree.ElementTree(with_ns(root))):
        for m in sorted({e.message for e in schema.error_log}):
            err("%s: XLIFF 1.2 schema: %s" % (lang, m))
    f = root.find("file")
    if f is None or f.get("target-language") != lang or f.get("source-language") != "en":
        err("%s: <file> must have source-language=\"en\" target-language=\"%s\"" % (lang, lang))
    units = {}
    for tu in root.iter("trans-unit"):
        k = tu.get("resname")
        if k in units:
            err("%s: duplicate resname %s" % (lang, k))
        src, tgt = tu.find("source"), tu.find("target")
        if src is None or tgt is None or not (tgt.text or "").strip():
            err("%s: %s needs a source and a non-empty target" % (lang, k))
            continue
        if lang != "en" and tu.get("translate") != "no" and not tgt.get("state"):
            err("%s: %s target has no state attribute" % (lang, k))
        units[k] = (src.text or "", tgt.text or "")
    files[lang] = units

if len(files) == 4:
    ref = set(files["en"])
    for lang in LANGS[1:]:
        if set(files[lang]) != ref:
            err("%s: keys differ from en: missing %s, extra %s" % (lang, sorted(ref - set(files[lang])), sorted(set(files[lang]) - ref)))
    for k in ref:
        ph = sorted(re.findall(r"\{\d+\}", files["en"][k][0]))
        for lang in LANGS:
            if k in files[lang] and sorted(re.findall(r"\{\d+\}", files[lang][k][1])) != ph:
                err("%s: %s placeholders differ from the English source" % (lang, k))

# Language menu: every language it offers needs its .lproj folder, and vice versa
menu_build = os.path.join(ROOT, "Project", "Sources", "Methods", "Menu_build.4dm")
if os.path.exists(menu_build):
    offered = set(re.findall(r'SET MENU ITEM PARAMETER\(\$language; -1; "([a-z]{2})"\)', open(menu_build, encoding="utf-8").read()))
    if offered != set(LANGS):
        err("Language menu offers %s, XLIFF languages are %s" % (sorted(offered), sorted(LANGS)))

# keys used
used = {}
def use(k, where): used.setdefault(k, set()).add(where)
def walk(o, where):
    if isinstance(o, dict):
        for v in o.values(): walk(v, where)
    elif isinstance(o, list):
        for v in o: walk(v, where)
    elif isinstance(o, str):
        for m in re.finditer(r":xliff:([A-Za-z0-9_.\-]+)", o): use(m.group(1), where)
src = os.path.join(ROOT, "Project", "Sources")
for p in glob.glob(os.path.join(src, "Forms", "*", "form.4DForm")) + [os.path.join(src, "menus.json")]:
    walk(json.loads(open(p, encoding="utf-8-sig").read()), os.path.relpath(p, ROOT))
literal_cmd = re.compile(r'\b(ALERT|CONFIRM|TextLabel|Message|APPEND MENU ITEM|Label\(AJUI_btn_default)\s*\(?[^\n]*?"([^"\n]*[A-Za-z][^"\n]*)"')
for p in glob.glob(os.path.join(src, "**", "*.4dm"), recursive=True):
    if ".bak-" in p: continue
    rel = os.path.relpath(p, ROOT)
    for n, line in enumerate(open(p, encoding="utf-8"), 1):
        code = line.split("//")[0] if not line.lstrip().startswith("//") else ""
        for m in re.finditer(r'\bL10n\(\s*"([^"]+)"', code): use(m.group(1), rel)
        for m in re.finditer(r'\bL10n_count\(\s*"([^"]+)"', code):
            use(m.group(1) + "One", rel); use(m.group(1) + "Other", rel)
        for m in re.finditer(r'Localized string(?::C991)?\(\s*"([^"]+)"', code): use(m.group(1), rel)
        for m in re.finditer(r'\bMenu_addItem\([^;]+;\s*"([^"]+)"', code): use(m.group(1), rel)
        for m in re.finditer(r':xliff:([A-Za-z0-9_]+)', code): use(m.group(1), rel)
        if os.path.basename(p) not in DEV_ONLY:
            m = literal_cmd.search(code)
            if m and "L10n" not in code:
                warnings.append("%s:%d literal text left: %s" % (rel, n, line.strip()))

known = set(files.get("en", {}))
for k, where in sorted(used.items()):
    if k.startswith("Common"):
        continue  # 4D's own Common<LANG>.xlf (File, Edit, Quit...)
    for lang in LANGS:
        if k not in files.get(lang, {}):
            err("key %s used in %s is missing from %s" % (k, ", ".join(sorted(where)), lang))
unused = sorted(known - set(used))
if unused:
    warnings.append("keys defined but not used: " + ", ".join(unused))

print("XLIFF files: %s, keys per file: %s" % (", ".join(sorted(files)), {l: len(u) for l, u in files.items()}))
print("keys used in forms, menus and methods: %d (+ %d 4D Common keys)" % (len([k for k in used if not k.startswith("Common")]), len([k for k in used if k.startswith("Common")])))
for w in warnings: print("WARNING", w)
for e in errors: print("ERROR", e)
print("OK" if not errors else "%d error(s)" % len(errors))
sys.exit(1 if errors else 0)
