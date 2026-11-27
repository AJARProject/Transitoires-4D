# Notes de version / Release notes

## Outils de développement : 4DPop et 4DPop XLIFF Pro (4D 21 R4)

- **Statut** : inclus dans cette version.
- **Pour qui** : le développement seulement. L'application et ses données ne changent pas.
- **Détails** : [OUTILS-DEV.md](OUTILS-DEV.md).

### Changements
- **Composants déclarés** :
  - `environment4d.json` (nouveau) pointe vers `LocalComponents/4DPop.4dbase` et `LocalComponents/4DPop XLIFF Pro.4dbase` ;
  - `dependencies.json` ajoute `4DPop` et `4DPop XLIFF Pro`, ainsi que leurs dépendances `UI with Classes` et `SVG with Classes` (GitHub, vdelachaux).
- **Palette automatique** : `settings.4DSettings` active `execute_host_database_event`, et la palette 4DPop s'affiche à l'ouverture du projet. La nouvelle méthode `launch4DPop` la rouvre à la main.
- **Builds** : portages 4D 21 R4 (branche `fixes/21R4`), 4DPop `ba84efd` et 4DPop XLIFF Pro `92565e6`. Les `.4DZ` ne sont pas versionnés : `LocalComponents/` est ignoré. L'installation et les empreintes SHA-1 sont décrites dans OUTILS-DEV.md.
- **Correction B38 dans XLIFF Pro** : la langue de référence choisie dans l'assistant est maintenant respectée. Avant, sur un système en français avec des fichiers en anglais, l'assistant revenait à chaque lancement et reproposait le français. L'ordre est maintenant : préférence enregistrée, puis `source-language` des fichiers, puis langue du système.
- **Touche Maj** : maintenir Maj en lançant XLIFF Pro rouvre l'assistant pour changer la langue de référence. Pour Transitoires, choisir English. Maj réinitialise aussi la géométrie des fenêtres.
- **Inchangé** : les fichiers `.xlf`. XLIFF Pro les réécrit dans son propre format, mais le contenu reste identique, et ces réécritures ne sont pas reprises.

### Testé
- **À l'écran**, le 27.11.2026, sur une copie du projet, 4D 21 R4, système fr-CH :
  - langue de référence English choisie avec Maj ;
  - l'assistant ne revient plus.
- **Test headless R-B38** (fixes/21R4 de XLIFF Pro), système fr-ch :
  - l'assistant propose en ;
  - le choix en est conservé sur deux relances ;
  - le contre-test sur l'ancien code reproduit la boucle.

---

## Transitoires : interface multilingue (fr, de, it, en)

- **Version** : 27.11.2026.
- **Base précédente** : la première version publique, migration 4D 21 R4 iso-fonctionnelle du 25.11.2026.
- **Environnement** : 4D 21 R4, mode projet.
- **Fichiers touchés** : 68 fichiers changés par rapport à la version du 25.11.2026, dont 31 nouveaux et 37 modifiés.
- **Contenu testé** : le contenu publié est celui qui a passé les tests décrits plus bas.

[English summary](#english-summary) at the end.

---

## Résumé

Transitoires parle maintenant **français, allemand, italien et anglais**. Les textes de l'interface sont sortis du code et des formulaires et placés dans des fichiers XLIFF de 106 clés.

Un menu **Langue** permet de choisir la langue, ou de suivre celle du système avec le mode **Automatique**. Le choix est mémorisé pour chaque utilisateur.

Dans les quatre langues, les montants et les dates s'affichent au format suisse. La devise stockée « Frs » s'affiche **CHF**.

Les données en base ne changent pas : les valeurs stockées (`debit`, `credit`, `Frs`) et les requêtes sont les mêmes qu'avant.

---

## Nouveautés pour l'utilisateur

### Quatre langues
Toute l'interface est traduite :
- menus et titre de fenêtre ;
- en-têtes de la liste, placeholders et libellés flottants ;
- bulles d'aide ;
- bandeau des filtres et bandeaux d'angle (« Aucun filtre », « Verrouillé ») ;
- messages, alertes et confirmations, avec singulier et pluriel ;
- impression : titre, en-têtes, pied « Total » et numéro de page.

### Menu Langue
- Les choix sont **Automatique (langue du système)**, **Français**, **Deutsch**, **Italiano** et **English**. Chaque langue est écrite dans sa propre langue, et une coche marque le choix actif.
- **Automatique** suit la langue de l'utilisateur du système : « fr-CH » donne le français. Une langue autre que fr, de, it ou en donne l'anglais.
- **Le choix est mémorisé** pour chaque utilisateur et repris au démarrage suivant. Avant cette version, Transitoires démarrait toujours en français.
- **Au changement de langue**, les menus se traduisent tout de suite. Transitoires propose de **rouvrir maintenant** la fenêtre, en gardant les filtres, l'année et la recherche, ou **plus tard**. Les modifications non enregistrées sont perdues à la réouverture, et le message le dit.

### Montants et devise
- La valeur stockée « Frs » s'affiche **CHF**. « Débit » et « Crédit » sont traduits à l'affichage.
- Les montants s'affichent au format suisse dans toutes les langues : `1'234'567.89` et `-1'234'567.89`.
- Avant cette version, un montant de plus de 6 chiffres entiers s'affichait `<<<`.

### Dates
Les dates suivent le format suisse `dd.MM.yyyy`, par exemple `27.11.2026`, dans toutes les langues, sur l'écran comme à l'impression. La date d'impression a la forme `27.11.2026, 15:40:56`.

### Anglais corrigé
La langue source est l'anglais, revu :
- « payed » devient « paid » ;
- « Unknow UUID » devient « Unknown UUID » ;
- « Calc Discount » devient « Calculate the discount » ;
- « No Credit Debit Filters » devient « No debit/credit filter » ;
- « Invoices deleted » devient « {1} invoices deleted » ;
- le titre de fenêtre « window title » devient « Accruals and Deferrals ».

Les messages qui étaient écrits en français dans le code, par exemple « facture(s) protégée(s) conservée(s) », sont maintenant des clés traduites, avec singulier et pluriel.

---

## Changements techniques

### Fichiers XLIFF
- **Emplacement** : `Resources/<lang>.lproj/Transitoires.xlf` pour `en`, `fr`, `de` et `it`. Ce sont des fichiers XLIFF 1.2 ; l'anglais est la langue source.
- **106 clés**, en camelCase avec le préfixe `tr`. Elles sont réparties en cinq groupes : `menus` (20), `Input` (39), `print_form` (14), `messages` (30) et `values` (3).
- **Références** : formulaires et menus utilisent `:xliff:clé`.

### Méthodes de traduction
- `L10n("clé"; valeur1; …)` appelle `Localized string` et remplace `{1}`, `{2}`… Si la clé manque, elle renvoie la clé. Elle préserve la variable OK.
- `L10n_count("trMsgX"; n)` choisit `trMsgXOne` ou `trMsgXOther`. En français, 0 et 1 prennent le singulier ; en anglais, allemand et italien, seul 1 le prend.
- `L10n_value(valeur)` traduit les valeurs stockées pour l'affichage seulement : `debit`, `credit`, et `Frs` affiché CHF.
- `filterSummary` construit le texte des filtres actifs, pour le bandeau et le titre d'impression.
- `AJUI_FloatingLabel_main` traduit les placeholders `:xliff:`, parce que `OBJECT Get placeholder` renvoie la référence brute.

### Langue et barre de menus
- **Démarrage** : `Language_startup` est la première action de `On Startup`. Elle appelle `SET DATABASE LOCALIZATION` avant tout formulaire et toute barre de menus.
- **Mode Automatique** : il s'appuie sur `Get database localization(User system localization)`.
- **Méthodes de langue** : `Language_getChoice`, `Language_saveChoice`, `Language_prefsFile`, `Language_resolve`, `Language_apply`, `Language_isChoice`, `Language_choiceFromText` et `Language_menu`.
- **Barre de menus construite par le code** (Fichier, Édition, Langue, Mode) :
  - `Menu_build` la construit avec `Create menu`, et `Menu_install` l'installe dans chaque process.
  - Un menu créé ainsi est partagé entre les process : au changement de langue, `Menu_applyTexts` réécrit les libellés et la coche à leur place, sans redémarrer.
  - Le formulaire Input n'est plus associé à « Barre #1 ».
  - Les deux libellés écrits en dur en français dans « Barre #1 » (« Transitoire » et « Données de test ») sont maintenant des clés.
- **Fenêtres ouvertes** : `Input_reopenAll` et `Input_reopenForLanguage` rouvrent la fenêtre Transitoires (`CALL FORM` puis `CANCEL`) en gardant les filtres.

### preferences.json robuste
- **Emplacement** : `Folder(fk user preferences folder)/Transitoires/preferences.json`, soit sur macOS `~/Library/Application Support/4D/Transitoires/preferences.json`. Le fichier n'est ni dans la structure ni dans les données.
- **Lecture** : `Language_choiceFromText` contrôle le type de la valeur (`Value type`), puis la liste des codes, et toute la lecture se fait dans un `Try`. Un fichier absent, vide ou illisible donne le mode Automatique sans message d'erreur. Il en va de même pour un JSON mal formé, `null`, un tableau, une propriété `language` absente ou qui n'est pas du texte, ou un code inconnu.
- **Écriture** : en UTF-8 avec BOM. Les autres propriétés du fichier sont gardées, et un fichier corrompu est remplacé. Si le dossier est en lecture seule, `Language_saveChoice` renvoie `False` sans exception, et l'alerte `trMsgLanguageNotSaved` est prévue (à vérifier à l'écran).

### Formats |Schweiz et |Schweiz2
Ils sont définis dans `Project/Sources/filters.json` :
- `|Schweiz` = `###'###'###'##0.00;-###'###'###'##0.00` ;
- `|Schweiz2` = `###'###'##0.0000;-###'###'##0.0000` (taux de change).

Une partie séparée pour les négatifs évite `<<<`, car le signe moins prend lui aussi une position. Le « . » est remplacé par le séparateur décimal du système : sur un Mac réglé autrement, on pourrait voir `1'000,00`.

### print_form et Input recalés
Largeurs finales dans `print_form`, la listbox `Invoice_lb` commençant à `left` 3 :

| Colonne | Contenu | Avant (version du 25.11.2026) | Après |
|---|---|---|---|
| Colonne1 | Date | 90 | **72** |
| Column1 | Facture | 120 | 120 |
| date_start_col | Début | 90 | **72** |
| date_end_col | Fin | 90 | **72** |
| Column4 | Montant facturé (pied `tot_amount_invoiced`) | 90 | **130** |
| rate | Taux | 70 | **62** |
| amount_invoiced_eur | Montant payé (pied `tot_amount_payed`) | 90 | **130** |
| days_start_col | Jours (année en cours) | 90 | **78** |
| days_end_col | Jours (année suivante) | 90 | **78** |
| Column9 | Montant (année en cours) | 100 | 100 |
| Column10 | Montant (année suivante) | 100 | 100 |
| **Listbox** | | **1020** (bord droit 1023) | **1014** (bord droit **1017**) |

- **Page** : en A4 paysage à 80 %, la zone imprimable mesurée fait 1022 px, et le tableau tient dedans.
- **`maxWidth`** : 130 sur Column4 et amount_invoiced_eur (100 avant). Les autres colonnes recalées gardent 100.
- **Écran Input** : les totaux `tot_amount_invoiced1`, `tot_amount_payed1` et `tot_amount_this_year` passent de 118 à **150 px**. Ils sont élargis vers la gauche, le bord droit ne bouge pas, et aucun objet ne les chevauche. `tot_amount_next_year` reste à 177 px.

### Outils et documentation
- **`i18n/check_xliff.py`** contrôle :
  - que le XML est bien formé ;
  - que les fichiers respectent le schéma XLIFF 1.2 strict (`i18n/xsd/`) ;
  - que les mêmes clés existent dans les quatre langues, avec les mêmes `{n}` ;
  - que chaque clé utilisée par les formulaires, les menus et les méthodes existe.
  La sortie doit finir par `OK`. Le script demande `lxml`.
- **`I18N.md`** (FR et EN) décrit le fonctionnement, les formats et leurs limites, et la façon d'ajouter un texte.
- **`i18n/translations-review.csv`** et **`.md`** forment le tableau de relecture : 106 lignes avec la clé, EN, FR, DE, IT et une note de contexte.
- **Tests unitaires** : `launch_unitTest` lance maintenant aussi `_i18n_unitTests` (préférences et formats), qui s'appuie sur la nouvelle méthode `UT_assertText`.

---

## Tests

### Validations à l'écran
- **Premier essai** sur une copie de test datée, le 27.11.2026 : interface en FR, IT et DE OK. Mais 4D démarrait toujours en français, ce qui a conduit à créer le menu Langue.
- **Après l'ajout du menu Langue**, validés à l'écran :
  - la compilation ;
  - le mode Automatique ;
  - le passage à DE et IT, avec réouverture de la fenêtre ;
  - la langue gardée après relance ;
  - le menu Édition.

### Tests automatisés
Le 27.11.2026, en 4D 21 R4, mode headless interprété, impression en PDF seulement :
- **Compilation** : 0 erreur, 0 avertissement.
- **Tests unitaires** : `launch_unitTest` 53/53, soit 9 + 9 + 35 assertions.
- **Clés** : 106/106 × 4 langues, aucune vide, aucun `:xliff:` brut. Les 20 libellés de menu sont corrects en fr, de, it, en, en mode Automatique et pour un code de langue inconnu.
- **Préférences** : les cas malformés (fichier absent, vide, JSON tronqué, non-JSON, tableau, `null`, code inconnu, objet à la place du texte, dossier à la place du fichier, fichier illisible…) retombent sur Automatique, sans boîte d'erreur au démarrage.
- **Données** : 30 factures de test, avec une empreinte SHA-256 identique après plusieurs changements de langue et après relance.
- **Formats**, identiques dans les 4 langues : `1'234'567.89`, `-1'234'567.89`, `999'999.99`, `-100'000.00`, `0.00`. Avec `|Schweiz2` : `1'234'567.8910`.
- **Page** : bord droit du tableau à 1017 px pour une zone imprimable de 1022 px. Dans les 4 PDF, le texte le plus à droite finit à 824.3 pt, sous la limite imprimable de 826.9 pt.
- **Pieds Montant facturé et Montant payé** (130 px, gras) : -9'999'999'999.99 est entier dans les 4 PDF.
- **Totaux Input** : « -99'999'999'999.99 » mesure 138 px pour 150 px (`OBJECT GET BEST SIZE`).
- **Colonnes réduites**, mesurées dans les 4 langues : en-têtes Jours 63 à 69 px pour 78 px ; en-têtes de date ≤ 38 px pour 72 px ; en-têtes Taux ≤ 41 px pour 62 px ; dates complètes dans 72 px.

### Encore à vérifier à la main
- **Vraie impression sur une imprimante** :
  - bord droit du tableau ;
  - pied de page « Pagina » ou « Seite » avec un numéro à 3 chiffres ;
  - libellé de filtres long ;
  - dialogue `PRINT SETTINGS`.
- **À l'écran** :
  - totaux Input à -99'999'999'999.99 ;
  - en-têtes de listbox traduits ;
  - dialogue « Rouvrir maintenant / Plus tard » avec des modifications non enregistrées ;
  - alerte « langue non enregistrée » ;
  - affichage d'une date vide.
- **Mode Automatique avec une autre langue système** : non testable en headless, car 4D lit la langue système réelle (fr-CH).

---

## Limites connues

- **13 chiffres significatifs.** 4D convertit les réels en texte sur 13 chiffres significatifs (doc de `String`). `|Schweiz` est donc exact jusqu'à **99'999'999'999.99**, négatifs compris. Au-delà, les dernières décimales sont perdues : 123'456'789'012.25 s'affiche `123'456'789'012.20`, et 999'999'999'999.99 donne `<<<`.
- **`|Schweiz2` : 9 chiffres entiers au plus.** Par exemple, 1234567890.5 donne `<<<`. Pour un taux de change, cela n'a pas d'effet pratique.
- **Montant à l'impression.** Les pieds Montant facturé et Montant payé (130 px, gras) sont garantis jusqu'à **-9'999'999'999.99**. -99'999'999'999.99 passe à la ligne et se lit « -99'999'999'999.9 ». Le positif +99'999'999'999.99 tient.
- **Column9 et Column10 à l'impression.** Les pieds des montants par année (100 px, gras) ne tiennent que jusqu'à environ **-9'999'999.99**. -10'000'000.00 passe déjà à la ligne. Le corps des colonnes, en caractères normaux, affiche -99'999'999.99 en entier.
- **Dates sans marge à l'impression.** Dans 72 px, « 28.02.2026 » commence 0.6 pt après le bord gauche de la colonne. Rien n'est coupé.
- **Menus Common de « Barre #1 ».** `menus.json` garde « Barre #1 », avec 12 libellés `:xliff:CommonMenu*` fournis par 4D. Ils restent en français quelle que soit la langue choisie. Cette barre n'apparaît qu'avant `On Startup`.
- **« Tester l'application ».** `On Startup` n'est appelée qu'une fois, à l'ouverture de la base (doc de *On Startup database method*). Passer du mode Développement au mode Application avec « Tester l'application » ne rejoue donc ni `Language_startup` ni l'installation de la barre. La barre peut alors être « Barre #1 », en français. Ce cas n'a pas été mesuré : à vérifier à l'écran. Après une relance de la base, tout est normal.
- **Fenêtres déjà ouvertes.** Un formulaire chargé garde sa langue, d'où la proposition de réouverture.
- **Taux à 4 chiffres entiers ou plus.** Un taux comme -12'345.6789 est abrégé dans la colonne Taux imprimée (62 px). Les taux réels n'en ont pas.
- **Zéro négatif.** -0.004 s'affiche `-0.00`.
- **Restés en anglais (messages de développeur)** :
  - tests unitaires ;
  - l'alerte FLabel ;
  - le composant `AJUI_BreadCrumb` ;
  - le titre `window title` de `print_form`, qui n'est jamais affiché.

---

## Défauts existant avant cette version, non corrigés

- **`print_page` dépasse la zone imprimable.** L'objet va jusqu'à 1044 px pour une zone de 1022. « Page 123 » est encore entier dans le PDF, mais un texte plus long comme « Pagina 123 » dépasserait la marge imprimable, et une imprimante pourrait le rogner. Correction possible : ramener le bord droit à ≤ 1022 px, par exemple avec `left` 934. Pas encore décidé.
- **Résumé des filtres long coupé.** `print_label` va jusqu'à 1023 px, et un libellé de filtres long (95 caractères dans le test) est coupé net au bord droit.
- **Column10 sans type nombre.** La colonne a le format `|Schweiz` mais pas `dataSourceTypeHint: "number"`, contrairement à Column9, dans Input comme dans print_form. Le format est à vérifier à l'écran et à l'impression.

---

## Ajouter une clé

1. Ajouter la `trans-unit` dans les **quatre** fichiers `Resources/<lang>.lproj/Transitoires.xlf`, dans le bon groupe, avec `id` = `resname` = la clé (`tr…`, en camelCase). Mettre `state="needs-review-translation"` tant que la traduction n'est pas relue.
2. L'utiliser avec `:xliff:clé` dans un formulaire ou un menu, `L10n("clé")` dans le code, ou `Menu_addItem(menu; "clé")` pour un élément de menu. Pour un pluriel, créer `…One` et `…Other` et utiliser `L10n_count`.
3. Ajouter la ligne dans `i18n/translations-review.csv` et `.md`.
4. Lancer `python3 i18n/check_xliff.py` : la sortie doit finir par `OK`.
5. Ne jamais utiliser le préfixe `Common`, qui appartient à 4D. Ne jamais créer deux clés qui ne diffèrent que par la casse.

## Ajouter une langue

1. Copier `Resources/en.lproj/Transitoires.xlf` dans `Resources/<code>.lproj/Transitoires.xlf`, mettre `target-language` au nouveau code et traduire les `target`.
2. Ajouter le code aux deux listes des langues acceptées : `Language_isChoice`, utilisée aussi par `Language_choiceFromText`, et `Language_resolve`. Mettre à jour les commentaires qui énumèrent les codes.
3. Ajouter une clé `trLanguageName<Code>`, le nom de la langue dans sa propre langue, non traduite. Ajouter l'élément dans le menu Langue (`Menu_build`, avec `SET MENU ITEM PARAMETER` = code).
4. Ajouter le code à `LANGS` dans `i18n/check_xliff.py`, qui vérifie aussi que le menu Langue propose exactement les langues XLIFF. Ajouter une colonne dans le tableau de relecture.
5. Lancer `check_xliff.py` et `launch_unitTest`, puis vérifier les largeurs des en-têtes à l'écran et à l'impression.

---

## Traductions à relire

- **101 traductions par langue** (FR, DE et IT) portent `state="needs-review-translation"`. Ce sont des premières versions, au registre suisse.
- **5 clés ne sont pas à traduire** (`translate="no"`) et n'ont pas cet état : les quatre noms de langue (`trLanguageName*`) et `trValueCurrencyCHF`.
- **Après relecture**, une cible passe à `state="final"`, ou perd l'attribut.
- **Support de relecture** : `i18n/translations-review.md`, ou le `.csv` dans un tableur. Chaque ligne a une note de contexte : où le texte apparaît, largeur, placeholders.
- **Points d'attention** :
  - Noms de menu macOS : « Ablage » en DE et « Archivio » en IT pour Fichier.
  - Bulle d'aide de recherche `trTipSearchHelp` : les motifs `...` et `&` doivent rester tels quels, car le code de recherche les lit.
  - Titre de fenêtre `trInputWindowTitle` : 31 caractères au plus.
  - Placeholders `{1}` : ils doivent rester dans chaque traduction.
  - Largeurs : dans les notes du tableau, les largeurs des en-têtes d'impression sont celles d'avant le recalage. Les largeurs actuelles sont dans le tableau de `print_form` plus haut. Un en-tête plus long doit tenir dans ces nouvelles largeurs, en particulier Date, Début et Fin (72 px), Taux (62 px) et Jours (78 px).

---

## English summary

Transitoires now runs in **French, German, Italian and English** (version of 27.11.2026).

- **For users**:
  - a **Language** menu (Automatic = system language, Français, Deutsch, Italiano, English), with the choice saved per user and applied at startup;
  - menus are retranslated in place, and the window can be reopened in the new language while keeping its filters;
  - stored "Frs" is displayed as **CHF**;
  - Swiss formats in every language (`1'234'567.89`, `27.11.2026`);
  - the English source text has been corrected ("paid", "Unknown UUID"…).
- **Technical**:
  - XLIFF 1.2 files, 106 keys, in `Resources/<lang>.lproj/Transitoires.xlf`;
  - `L10n`, `L10n_count` and `L10n_value`;
  - a shared menu bar built by `Menu_build` (`Create menu`);
  - a robust `preferences.json` in the 4D user preferences folder, where anything malformed falls back to Automatic;
  - `|Schweiz` and `|Schweiz2` formats with a separate negative part;
  - print_form and Input widths reworked: the printed table ends at 1017 px for a 1022 px printable width, amount footers are 130 px and Input totals 150 px;
  - `check_xliff.py`, `I18N.md` and a review table.
- **Tests**:
  - validated on screen;
  - automated headless run: 0 compile errors or warnings, `launch_unitTest` 53/53, 106/106 keys in 4 languages, and the table fits on the page.
- **Known limits**:
  - exact up to 99'999'999'999.99 (13 significant digits);
  - printed amount footers guaranteed up to -9'999'999'999.99, Column9/10 footers up to about -9'999'999.99;
  - the Common menus of "Barre #1" stay in French;
  - "Test application" does not replay On Startup.
- **Pre-existing, not fixed**:
  - `print_page` extends past the printable area;
  - a long filter summary is cut off;
  - Column10 has no number type hint.
- **To review**: 101 FR/DE/IT targets per language are marked `needs-review-translation`.
