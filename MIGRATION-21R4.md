# Migration 4D 21 R4 — iso-fonctionnel / iso-functional

Branche / branch: `migration/21R4-iso-fonctionnel` (depuis / from `master`).

Cette PR modernise le code sans changer le calcul des transitoires. Le passage aux classes ORDA, aux classes de formulaire et à l’impression sans variables interprocess `<>` est volontairement laissé pour la PR 2.

This PR modernises the code without changing the transitory-account calculation. ORDA entity classes, form classes, and printing without interprocess `<>` variables are left for PR 2.

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.

Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.

## Français

### Ce qui a changé

- Déclarations `var` et `#DECLARE`, plus de `C_XXX` ni de `$0` / `$1`. Les méthodes partagées le restent, y compris les noms appelés par les composants (`setType`, `setCurrency`, `typeFilter_cb`, `currencyFilter_cb`, `newInvoice`, `saveInvoice`, `deleteInvoice`, `calcDiscount`, `refreshInvoice`, `print_selection_cb`, `_days_currentyear`, `_days_nextyear`).
- `&&` / `||`, `return`, ternaires, littéraux `{}`. Les `&` des recherches (`@&@`, `01.01&05.05`) ne sont pas des opérateurs et sont inchangés.
- `Date("jj/mm/aaaa")` est remplacé par `Add to date(!00-00-00!; année; mois; jour)` ou par `dateFromText`, qui lit l’ISO `AAAA-MM-JJ` et, sinon, jour/mois/année avec le pivot à 30 de `Date()` ([documentation](https://developer.4d.com/docs/21-R4/commands/date)).
- Les variables interprocess d’impression sont conservées.

### Composants

Fichier `Project/Sources/dependencies.json`. Les `.4DZ` de 2020 correspondants ont été retirés, sinon le dossier `Components` aurait priorité sur GitHub.

| Composant | Dépôt GitHub | Version retenue | Release constatée |
| --- | --- | --- | --- |
| AJUI_Button | AJARProject/AJUI_Button_source | 2.2.1 | « AJUI_Button 2.2.1 (4D 21 R4) », asset `AJUI_Button_source.zip` |
| AJUI_Banner | AJARProject/AJUI_Banner_source | 1.9.0 | « AJUI_Banner 1.9.0 (4D 21 R4) » |
| AJUI_Tip | AJARProject/AJUI_Tip_source | 1.8.1 | « AJUI_Tip 1.8.1 (4D 21 R4) » |
| AJ_Math | AJARProject/AJ_Math_source | 2.1.1 | « AJ_Math 2.1.1 — 4D 21 R4 » |
| 4D Widgets | 4d/4D-Widgets | `"version": "4d"` (suivre la version 4D) | tags `21R4.1` et `21R4.2` |
| 4D SVG | 4d/4D-SVG | `"version": "4d"` | tags `21R4.1` et `21R4.2` |

Ouvert dans 4D 21 R4, la règle « suivre la version 4D » résout Widgets et SVG vers le dernier tag `21R4.*` (au moment de cette PR : `21R4.2`).

- `AJ_Tools_roundDecimal` n’est pas une méthode du build 2.1.1 (vérifié dans `methodAttributes.json` du `.4DZ`). L’API publiée est `AJ_Math.new().roundDecimal(valeur; précision; mode)`. Les trois appels passent par là, toujours avec `0.05` ou `0.0001` et `"ROUND_HALF_UP"`.
- 4D Widgets n’est plus livré dans l’installeur 21. `SearchPicker` (sous-formulaire + `SearchPicker SET HELP TEXT`) est référencé par la dépendance ci-dessus.
- Le code hôte n’appelle aucune commande `SVG_`. Le moteur SVG intégré affiche toujours les `.svg`. Button, Banner et Tip déclarent eux-mêmes 4D SVG ; la dépendance hôte fixe la règle « suivre 4D » pour rester sur un build 21 R4.
- AJUI_ProgressBar : inutilisé, supprimé.
- AJ_Tools_UnitTest : supprimé. `UT_assert` et `launch_unitTest` rejouent les tests `days_*` avec les mêmes nombres attendus.
- **AJUI_BreadCrumb** : le `.4DZ` de 2020 ne se charge pas en 21 R4 (erreur `-10508`, `New AJUI_BreadCrumb` introuvable dans `Input.bc1`). Il est remplacé par les sources interprétées **1.3.0** de [AJARProject/AJUI_Breadcrumb_source](https://github.com/AJARProject/AJUI_Breadcrumb_source) branche `migration/21R4` (PR #4, commit `4988750`), copiées dans `Components/AJUI_BreadCrumb.4dbase/` (dossier `Project` standard). Un hôte interprété peut charger un composant interprété ; le dossier `Components` a la priorité sur `dependencies.json` ([Dependencies](https://developer.4d.com/docs/21-R4/Project/components)). Le `dependencies.json` d’un composant placé dans `Components/` est ignoré : 4D SVG est donc fourni par la dépendance de l’hôte (`"4D SVG": {"github": "4d/4D-SVG", "version": "4d"}`), ce dont `SVG_New` et les autres commandes `SVG_*` ont besoin. Dès que la release **1.3.0** est publiée, supprimer ce dossier et déclarer `"AJUI_BreadCrumb": {"github": "AJARProject/AJUI_Breadcrumb_source", "version": "1.3.0"}`. Le commit `4988750` remplace `GET MOUSE` par `MOUSE POSITION` (commande 468, renommée en 20 R7). Sans le jeton `:C468`, l’ancien nom ne se résout plus en 21 R4 (erreur 37). Les 21 autres renommages de cette liste, ainsi que les constantes `:K` utilisées par l’hôte (`On Load`, `Plain form window`, `On the left`, `At the top`, `lk printing is over`, `Current resources folder`, `Folder separator`, `Object current`, `Object named`, `Orientation option`, `Scale option`), portent encore leur nom actuel dans la doc 21 R4 : aucun autre remplacement dans les méthodes de Transitoires.
- **AJUI_FloatingLabel** : le binaire 2020 (`Components/AJUI_FloatingLabel.4dbase`, 1.1.1) est retiré. `AJUI_FloatingLabel_main` est désormais une méthode locale, même signature (`$params : Object`, sans retour), appelée avec `Form`. Le dépôt [minzirillo/JVFloatingLabel](https://github.com/minzirillo/JVFloatingLabel) n’a pas été modifié. Valeurs par défaut du wiki 1.1.1 : position `top`, offset `0`, `activColor` = couleur de `FLabel_obj` (sinon `#0C13DF`), `inactivColor` = `0x00AAAAAA`, `showOnEmptyField` = Faux. Le libellé est le duplicata `<cible>_FLabel_obj`, au-dessus du champ (ou à gauche), visible s’il y a une valeur ou si `showOnEmptyField` est vrai. `0` numérique n’est pas vide (le champ affiche 0) ; une date `!00-00-00!` et un texte `""` le sont. `On Data Change` est traité comme `On After Edit` pour la visibilité, parce que les champs de saisie l’activent. Ce comportement n’a pas été exécuté dans 4D.

### Bogues corrigés

- `ON ERR CALL("err")` appelait une méthode absente. `err` copie la variable système `Error` (ce n’est pas une commande) pour que l’annulation d’impression `-128` soit lue ensuite. L’exécution reprend à la ligne suivante ; la méthode n’appelle pas `ABORT`. [ON ERR CALL](https://developer.4d.com/docs/21-R4/commands/on-err-call).
- `deleteSelection` lisait `$notDropped` même si l’utilisateur annulait. Le contrôle n’a lieu qu’après un drop confirmé.
- Division par zéro si le nombre de jours N + N+1 vaut 0, et si `amount_invoiced` vaut 0 dans le calcul du taux.
- `amount_payed_value` écrivait `formPath` vers `currentInvoice.amount_invoiced` (copier-coller). La valeur est `currentInvoice.amount_payed`.
- `AJUI_Tip_getSubFormSize` est partagée, car AJUI_Tip l’appelle par son nom.
- SearchPicker : rechargement de la liste uniquement si le texte de recherche change (évite qu’un On Data Change renvoyé par 4D Widgets après le CONFIRM de Save resynchronise la liste sur la première ligne et masque l’état Protect).
- Bug v20 : « Lock selection », « Unlock selection » et Option+Protect enregistraient `locked` sans mettre à jour `Form.btnProtect.protect` ni appeler `Lock_invoice_item`. Le bandeau restait masqué, les champs saisissables ; un Save suivant échouait (stamp, erreur 1263, « Error, Invoice can't be edited ») ou réécrivait `locked` depuis le bouton. Après un `save()` réussi, si la facture courante est dans la sélection, `reload()` recharge son stamp, Protect suit `locked`, et Save est désactivé. La liste est réaffichée par `Form.allInvoices:=Form.allInvoices`. `reloadListAndInputArea` n’est pas appelé : il sélectionne la ligne 1.

### Changements de comportement demandés

- La poubelle (`btnDelete` → `deleteInvoice`, méthode partagée) et le menu « Delete selection » (`deleteSelection`) suppriment toute la sélection (`Form.invoice_items`), sauf les factures protégées (`locked` = Vrai), qui ne sont jamais supprimées. S’il n’y a que des factures protégées : alerte `Cette facture est "protect", elle ne peut pas être supprimée.` (une) ou `Ces factures sont protégées, elles ne peuvent pas être supprimées.` (plusieurs), puis arrêt. Sinon, confirmation anglaise. La touche Option ne saute que cette confirmation, et seulement depuis la poubelle (`OK:=1` est alors forcé). Une facture à effacer : le message cite `invoice_ref`. Plusieurs : `Do you want to delete the selection ?`. Après l’effacement, s’il reste des protégées : `<n> facture(s) protégée(s) conservée(s).`, sinon `Invoice deleted` ou `Invoices deleted`. Si le drop échoue : `<n> invoice(s) not deleted`. Sélection vide : la poubelle applique la même règle à `Form.invoice_item`. Les confirmations « voulez-vous vraiment la supprimer » sont retirées.
- Infobulle de la poubelle (`btnDelete`, AJUI_Tip `TextLabel` au survol) : `Delete the invoice lines` si plus d’une facture est sélectionnée (`Form.invoice_items.length>1`), sinon `Delete the invoice line`.

### Ouvrir et générer des données

1. Ouvrir `Project/transitoires.4DProject` avec 4D 21 R4.
2. Créer un fichier de données neuf quand 4D le demande. Aucun `.4DD` n’est versionné.
3. En interprété, si `invoice` est vide et que l’application n’est ni compilée ni fusionnée (`4D Volume desktop`), `On Startup` appelle `DEV_seedFakeData`.
4. Sinon : menu Fichier → **Données de test**, ou exécuter `DEV_seedFakeData`. La méthode refuse de tourner en compilé ou en application fusionnée. Si des factures existent déjà, elle demande confirmation.
5. `launch_unitTest` lance les assertions `days_*`.

Pour prendre le correctif BreadCrumb : `git pull` de `migration/21R4-iso-fonctionnel`, quitter 4D complètement, rouvrir `Project/transitoires.4DProject` en 21 R4. Les composants ne sont lus qu’au démarrage. Dans Dépendances du projet, `AJUI_BreadCrumb` vient du dossier `Components` (interprété) et `4D SVG` de GitHub. Puis menu Fichier → Transitoire.

Le seed crée 30 factures : débit et crédit, `Frs` (CHF), `€` (EUR) et `$` (USD), périodes à cheval sur le 31 décembre, entièrement en N ou en N+1, protégées ou non, un jour, et le 29 février 2024. Le code ne reconnaît comme monnaie locale que le libellé `Frs` : les enregistrements utilisent donc ces trois libellés, pas les codes ISO.

`Project/Sources/settings.4DSettings` est versionné (exception dans `.gitignore`). Notation pointée, jetons Unicode, serveur web non publié au démarrage, REST non lancé au démarrage. SQL laissé au réglage d’usine.

### Liste de tests manuels

- [ ] Le projet s’ouvre en 21 R4 et télécharge les dépendances GitHub.
- [ ] Une base vide se remplit au démarrage interprété ; une base compilée ou fusionnée ne se remplit pas.
- [ ] La liste des années contient 2024, 2025 et 2026 ; l’année courante est sélectionnée si elle existe.
- [ ] Filtres débit/crédit et Frs / € / $, et le bouton sans filtre.
- [ ] Recherche `01.01.20...05.05.20` et `01.01&05.05`.
- [ ] Création, modification, enregistrement, suppression, suppression de sélection annulée puis confirmée.
- [ ] Protection d’une ligne et d’une sélection (touche Option).
- [ ] Montant étranger à 0 : le taux devient 0, pas une erreur.
- [ ] Période d’un jour et période à cheval sur le 31 décembre : jours et montants au 0.05, totaux.
- [ ] 29 février 2024 accepté par le seed.
- [ ] Impression du récapitulatif, y compris annulation, et libellés de colonnes.
- [ ] Fil d’Ariane : `New AJUI_BreadCrumb` ne lève plus `-10508`. Débit/crédit et Frs / € / $ se dessinent.
- [ ] Infobulles et SearchPicker.
- [ ] Libellés flottants : au chargement, le texte d’exemple est au-dessus du champ (offset 0). Focus = bleu `#0C13DF`, perte de focus = gris. Champ vide avec `showOnEmptyField` : le libellé reste. Sans l’objet `FLabel_obj` : alerte « You must create the FLabel form object (FLabel_obj) to process. »
- [ ] `launch_unitTest` annonce que toutes les assertions passent.

### Ce qui n’a pas pu être testé

Maurice a ouvert la branche en 4D 21 R4 interprété, puis une compilation sans interface a signalé 4 erreurs et 15 avertissements, corrigés ensuite. `Print object` est une fonction : son booléen est affecté, et seul le résultat de la list box peut terminer l’impression ([Print object](https://developer.4d.com/docs/21-R4/commands/print-object)). Les variables process et interprocess ne sont plus déclarées qu’une fois (`compiler_variables`, ou l’objet de formulaire quand il porte déjà le type). `<>page` était marqué entier sur le formulaire alors que la valeur est le texte « Page N ». L’index de `years_list` est un entier lu avant l’accès au tableau.

4D Labels et 4D Report ne sont pas utilisés. Au premier lancement, 4D 21 propose d’importer les composants qui étaient livrés avec l’application ([notes de version](https://developer.4d.com/docs/21/Notes/updates)) : Import, Ignorer, ou Plus tard. Choisir **Ignorer**. Les composants voulus sont déjà dans `dependencies.json`. Le fichier projet indique `compatibilityVersion` 2140 (21 R4). Une compilation headless peut avoir chargé Labels et Report localement ; ils ne font pas partie de ce dépôt.

## English

### What changed

- `var` and `#DECLARE` everywhere. `C_XXX` and `$0` / `$1` are gone. Shared methods stay shared, including the names components call (`setType`, `setCurrency`, `typeFilter_cb`, `currencyFilter_cb`, `newInvoice`, `saveInvoice`, `deleteInvoice`, `calcDiscount`, `refreshInvoice`, `print_selection_cb`, `_days_currentyear`, `_days_nextyear`).
- `&&` / `||`, `return`, ternaries, `{}` literals. The `&` characters in searches (`@&@`, `01.01&05.05`) are text, not operators, and are unchanged.
- `Date("dd/mm/yyyy")` is replaced by `Add to date(!00-00-00!; year; month; day)` or by `dateFromText`, which reads ISO `YYYY-MM-DD` and otherwise day/month/year with `Date()`'s default pivot of 30 ([documentation](https://developer.4d.com/docs/21-R4/commands/date)).
- Printing still uses the interprocess variables.

### Components

Declared in `Project/Sources/dependencies.json`. The matching 2020 `.4DZ` packages were removed, because a copy in `Components` would override GitHub.

| Component | GitHub repository | Pinned version | Release that was checked |
| --- | --- | --- | --- |
| AJUI_Button | AJARProject/AJUI_Button_source | 2.2.1 | "AJUI_Button 2.2.1 (4D 21 R4)", asset `AJUI_Button_source.zip` |
| AJUI_Banner | AJARProject/AJUI_Banner_source | 1.9.0 | "AJUI_Banner 1.9.0 (4D 21 R4)" |
| AJUI_Tip | AJARProject/AJUI_Tip_source | 1.8.1 | "AJUI_Tip 1.8.1 (4D 21 R4)" |
| AJ_Math | AJARProject/AJ_Math_source | 2.1.1 | "AJ_Math 2.1.1 — 4D 21 R4" |
| 4D Widgets | 4d/4D-Widgets | `"version": "4d"` (Follow 4D version) | tags `21R4.1` and `21R4.2` |
| 4D SVG | 4d/4D-SVG | `"version": "4d"` | tags `21R4.1` and `21R4.2` |

Opened in 4D 21 R4, Follow 4D version resolves Widgets and SVG to the latest `21R4.*` tag (at the time of this PR: `21R4.2`).

- `AJ_Tools_roundDecimal` is not a method of the 2.1.1 build (checked in the `.4DZ` `methodAttributes.json`). The published API is `AJ_Math.new().roundDecimal(value; precision; mode)`. The three call sites use that, still with `0.05` or `0.0001` and `"ROUND_HALF_UP"`.
- 4D Widgets no longer ships inside the 4D 21 installer. `SearchPicker` (subform plus `SearchPicker SET HELP TEXT`) is referenced by the dependency above.
- Host code calls no `SVG_` command. The built-in SVG engine still draws `.svg` pictures. Button, Banner and Tip declare 4D SVG themselves; the host dependency pins Follow 4D version so a 21 R4 build is selected.
- AJUI_ProgressBar: unused, removed.
- AJ_Tools_UnitTest: removed. `UT_assert` and `launch_unitTest` replay the `days_*` tests with the same expected numbers.
- **AJUI_BreadCrumb**: the 2020 `.4DZ` does not load in 21 R4 (error `-10508`, `New AJUI_BreadCrumb` not found in `Input.bc1`). It is replaced by the interpreted **1.3.0** sources from [AJARProject/AJUI_Breadcrumb_source](https://github.com/AJARProject/AJUI_Breadcrumb_source) branch `migration/21R4` (PR #4, commit `4988750`), copied into `Components/AJUI_BreadCrumb.4dbase/` (a standard `Project` folder). An interpreted host can load an interpreted component, and the `Components` folder has priority over `dependencies.json` ([Dependencies](https://developer.4d.com/docs/21-R4/Project/components)). A component loaded from `Components/` ignores its own `dependencies.json`, so 4D SVG is provided by the host dependency (`"4D SVG": {"github": "4d/4D-SVG", "version": "4d"}`), which `SVG_New` and the other `SVG_*` calls need. Once release **1.3.0** is published, delete this folder and declare `"AJUI_BreadCrumb": {"github": "AJARProject/AJUI_Breadcrumb_source", "version": "1.3.0"}`. Commit `4988750` replaces `GET MOUSE` with `MOUSE POSITION` (command 468, renamed in 20 R7). Without the `:C468` token, the old name does not resolve in 21 R4 (error 37). The other 21 renames from that list, and the `:K` constants used by the host (`On Load`, `Plain form window`, `On the left`, `At the top`, `lk printing is over`, `Current resources folder`, `Folder separator`, `Object current`, `Object named`, `Orientation option`, `Scale option`), still have those names in the 21 R4 docs: no other replacement in the Transitoires methods.
- **AJUI_FloatingLabel**: the 2020 binary (`Components/AJUI_FloatingLabel.4dbase`, 1.1.1) is removed. `AJUI_FloatingLabel_main` is now a local method with the same signature (`$params : Object`, no return), called with `Form`. [minzirillo/JVFloatingLabel](https://github.com/minzirillo/JVFloatingLabel) was not modified. Defaults from the 1.1.1 wiki: position `top`, offset `0`, `activColor` taken from `FLabel_obj` (otherwise `#0C13DF`), `inactivColor` `0x00AAAAAA`, `showOnEmptyField` False. The label is the duplicate `<target>_FLabel_obj`, above the field (or to its left), visible when the field has a value or when `showOnEmptyField` is True. A numeric `0` is not empty (the field shows 0); a date `!00-00-00!` and a text `""` are. `On Data Change` is handled like `On After Edit` for visibility, because the input objects enable that event. This was not executed in 4D.

### Bugs fixed

- `ON ERR CALL("err")` called a missing method. `err` copies the `Error` system variable (it is not a command) so a print cancel (`-128`) can be read afterwards. Execution resumes on the next line; the method does not call `ABORT`. [ON ERR CALL](https://developer.4d.com/docs/21-R4/commands/on-err-call).
- `deleteSelection` read `$notDropped` even when the user cancelled. The check runs only after a confirmed drop.
- Division by zero when the N + N+1 day count is 0, and when `amount_invoiced` is 0 while computing the rate.
- `amount_payed_value` wrote `formPath` to `currentInvoice.amount_invoiced` (a copy-paste). It is now `currentInvoice.amount_payed`.
- `AJUI_Tip_getSubFormSize` is shared, because AJUI_Tip calls it by name.
- SearchPicker: the list reloads only when the search text changes (avoids an On Data Change sent by 4D Widgets after the Save CONFIRM resynchronizing the list onto the first row and hiding the Protect state).
- Pre-existing v20 bug: Lock selection, Unlock selection, and Option+Protect saved `locked` without updating `Form.btnProtect.protect` or calling `Lock_invoice_item`. The banner stayed hidden and the fields stayed enterable; a later Save could fail (stamp mismatch, error 1263, "Error, Invoice can't be edited") or write `locked` from the button and unlock the invoice. After a successful `save()`, if the current invoice is in the selection, `reload()` refreshes its stamp, Protect follows `locked`, and Save is disabled. The list is redrawn with `Form.allInvoices:=Form.allInvoices`. `reloadListAndInputArea` is not called, because it selects row 1.

### Requested behaviour changes

- The trash button (`btnDelete` → `deleteInvoice`, shared method) and the “Delete selection” menu (`deleteSelection`) delete the whole selection (`Form.invoice_items`), except protected invoices (`locked` = True), which are never deleted. If only protected invoices are selected: alert `Cette facture est "protect", elle ne peut pas être supprimée.` (one) or `Ces factures sont protégées, elles ne peuvent pas être supprimées.` (several), then stop. Otherwise the English confirmation is shown. The Option key skips only that confirmation, and only from the trash button (`OK:=1` is set in that branch). One invoice to delete: the message includes `invoice_ref`. Several: `Do you want to delete the selection ?`. After the drop, if some protected invoices remain: `<n> facture(s) protégée(s) conservée(s).`, otherwise `Invoice deleted` or `Invoices deleted`. If the drop fails: `<n> invoice(s) not deleted`. Empty selection: the trash button applies the same rule to `Form.invoice_item`. The “voulez-vous vraiment la supprimer” confirmations are removed.
- Trash button tip (`btnDelete`, AJUI_Tip `TextLabel` on mouse enter): `Delete the invoice lines` when more than one invoice is selected (`Form.invoice_items.length>1`); otherwise `Delete the invoice line`.

### Open the app and seed data

1. Open `Project/transitoires.4DProject` with 4D 21 R4.
2. Create a new data file when 4D asks. No `.4DD` is versioned.
3. In interpreted mode, if `invoice` is empty and the application is neither compiled nor merged (`4D Volume desktop`), `On Startup` calls `DEV_seedFakeData`.
4. Otherwise: File → **Données de test**, or run `DEV_seedFakeData`. The method refuses to run when compiled or merged. If invoices already exist, it asks for confirmation.
5. `launch_unitTest` runs the `days_*` assertions.

To pick up the BreadCrumb fix: `git pull` on `migration/21R4-iso-fonctionnel`, quit 4D completely, and reopen `Project/transitoires.4DProject` in 21 R4. Components are read only at startup. In Project Dependencies, `AJUI_BreadCrumb` comes from the `Components` folder (interpreted) and `4D SVG` from GitHub. Then File → Transitoire.

The seed creates 30 invoices: debit and credit, `Frs` (CHF), `€` (EUR) and `$` (USD), periods across 31 December, fully in N or N+1, protected or not, a single day, and 29 February 2024. The calculation treats only the literal `Frs` as the local currency, so the records use those three labels rather than the ISO codes.

`Project/Sources/settings.4DSettings` is versioned (a `.gitignore` exception). Dot notation and Unicode tokens are on. The web server is not published at startup and REST is not launched at startup. SQL is left at the factory default.

### Manual test checklist

- [ ] The project opens in 21 R4 and downloads the GitHub dependencies.
- [ ] An empty interpreted database is seeded on startup; a compiled or merged one is not.
- [ ] The year list contains 2024, 2025 and 2026; the current year is selected when it is present.
- [ ] Debit/credit and Frs / € / $ filters, and the clear-filter buttons.
- [ ] Search `01.01.20...05.05.20` and `01.01&05.05`.
- [ ] Create, edit, save, delete, and cancel then confirm a selection delete.
- [ ] Protect one row and a selection (Option key).
- [ ] A foreign amount of 0 sets the rate to 0 and does not raise an error.
- [ ] A one-day period and a period across 31 December: days, amounts rounded to 0.05, totals.
- [ ] 29 February 2024 from the seed is accepted.
- [ ] Print the recap, including cancel, and the column titles.
- [ ] Breadcrumb: `New AJUI_BreadCrumb` no longer raises `-10508`. Debit/credit and Frs / € / $ draw.
- [ ] Tips and SearchPicker.
- [ ] Floating labels: on load, the placeholder sits above the field (offset 0). Focus is blue `#0C13DF`, blur is grey. An empty field with `showOnEmptyField` keeps the label. Without `FLabel_obj`: alert "You must create the FLabel form object (FLabel_obj) to process."
- [ ] `launch_unitTest` reports that every assertion passed.

### What could not be tested

Maurice opened the branch in interpreted 4D 21 R4, then a headless compile reported 4 errors and 15 warnings, which were fixed afterwards. `Print object` is a function: its Boolean is assigned, and only the list box result may end the job ([Print object](https://developer.4d.com/docs/21-R4/commands/print-object)). Process and interprocess variables are declared once (`compiler_variables`, or the form object when that object already types the variable). `<>page` was marked integer on the form while the value is the text "Page N". The `years_list` index is read into an integer before the array access.

4D Labels and 4D Report are not used. On the first launch, 4D 21 offers to import the components that used to ship inside the application ([release notes](https://developer.4d.com/docs/21/Notes/updates)): Import, Ignore, or Ask later. Choose **Ignore**. The components this project needs are already in `dependencies.json`. The project file sets `compatibilityVersion` to 2140 (21 R4). A headless compile may have loaded Labels and Report locally; they are not part of this repository.
