# Transitoires

[Français](#français) · [English](#english)

## Français

Transitoires est une application 4D qui calcule les transitoires d'une année comptable. Pour chaque facture dont la période couvre deux exercices, elle répartit le montant au prorata des jours entre l'année N et l'année N+1.

### Fonctionnalités

- Une table `invoice` : référence, date de facture, période (début, fin), type débit ou crédit, monnaie (`Frs`, `€`, `$`), montant facturé, montant payé, taux et protection (`locked`).
- Prorata : nombre de jours de la période dans l'année N et dans l'année N+1, montant de chaque année arrondi à 0.05 (`AJ_Math.roundDecimal`, `ROUND_HALF_UP`). Seul `Frs` est traité comme monnaie locale. Pour `€` et `$`, le prorata porte sur le montant payé, et le taux est calculé à partir des deux montants.
- Liste des factures par année, avec filtres débit / crédit et Frs / € / $, et totaux N et N+1.
- Recherche par référence ou par date. `01.01.20...05.05.20` cherche une période dans l'année, `01.01&05.05` cherche des dates de facture.
- Création, modification et enregistrement d'une facture. Un rabais en % peut être appliqué ; il est ajouté à la référence.
- Protection d'une facture : une facture protégée n'est plus modifiable et n'est jamais supprimée. Clic droit sur la liste : protéger, déprotéger ou supprimer la sélection.
- Impression d'un récapitulatif de l'année : jours et montants N et N+1 par facture, et totaux.
- Interface en français, allemand, italien et anglais, avec un menu **Langue** (ou la langue du système). Le choix est mémorisé par utilisateur. Montants et dates au format suisse ; la devise stockée `Frs` s'affiche CHF.
- `DEV_seedFakeData` crée 30 factures fictives (menu Fichier → **Données de test**). Il ne tourne pas en compilé ni en application fusionnée. `launch_unitTest` rejoue les tests du calcul des jours.

### Prérequis

- 4D 21 R4, mode projet (`compatibilityVersion` 2140).
- Un accès à GitHub au premier lancement. 4D télécharge les composants déclarés dans `Project/Sources/dependencies.json` : AJUI_Button 2.2.1, AJUI_Banner 1.9.0, AJUI_Tip 1.8.1, AJ_Math 2.1.1 (AJAR SA, licence MIT), 4D Widgets et 4D SVG (4D, « suivre la version 4D »), UI with Classes et SVG with Classes (vdelachaux).
- AJUI_BreadCrumb 1.3.0 (AJAR SA, MIT) est fourni en sources dans `Components/AJUI_BreadCrumb.4dbase/`.
- Facultatif, pour le développement : 4DPop et 4DPop XLIFF Pro dans `LocalComponents/` (non versionné, voir [OUTILS-DEV.md](OUTILS-DEV.md)). Sans eux, 4D les signale comme introuvables dans les dépendances ; l'application fonctionne quand même.

### Installation

1. Cloner le dépôt : `git clone https://github.com/AJARProject/Transitoires-4D.git`
2. Ouvrir `Project/transitoires.4DProject` avec 4D 21 R4.
3. Créer un fichier de données neuf quand 4D le demande. Aucun fichier de données n'est versionné.
4. Si 4D propose d'importer les anciens composants intégrés, choisir **Ignorer**.
5. En interprété, une base vide est remplie avec les factures fictives au démarrage.
6. Menu Fichier → **Transitoires**.

Documentation :

- [MIGRATION-21R4.md](MIGRATION-21R4.md) : migration vers 4D 21 R4.
- [I18N.md](I18N.md) : interface multilingue fr/de/it/en.
- [RELEASE-NOTES.md](RELEASE-NOTES.md) : notes de version.
- [OUTILS-DEV.md](OUTILS-DEV.md) : outils de développement 4DPop et 4DPop XLIFF Pro (facultatifs).

### Licence

MIT, voir [LICENSE](LICENSE). Les composants téléchargés par `dependencies.json` gardent leur propre licence.

## English

Transitoires is a 4D application that computes the accruals and deferrals of a financial year. For each invoice whose period spans two years, it splits the amount between year N and year N+1 in proportion to the number of days.

### Features

- One `invoice` table: reference, invoice date, period (start, end), debit or credit type, currency (`Frs`, `€`, `$`), invoiced amount, paid amount, rate, and protection (`locked`).
- Prorata: the number of days of the period in year N and in year N+1, and each year's amount rounded to 0.05 (`AJ_Math.roundDecimal`, `ROUND_HALF_UP`). Only `Frs` is treated as the local currency. For `€` and `$`, the prorata uses the paid amount, and the rate is computed from the two amounts.
- Invoice list per year, with debit / credit and Frs / € / $ filters, and totals for N and N+1.
- Search by reference or by date. `01.01.20...05.05.20` finds a period inside the year, `01.01&05.05` finds invoice dates.
- Create, edit and save an invoice. A discount in % can be applied; it is appended to the reference.
- Invoice protection: a protected invoice can no longer be edited and is never deleted. Right-click on the list to protect, unprotect or delete the selection.
- Print a summary of the year: days and amounts for N and N+1 per invoice, and totals.
- Interface in French, German, Italian and English, with a **Language** menu (or the system language). The choice is saved per user. Swiss number and date formats; the stored `Frs` currency is displayed as CHF.
- `DEV_seedFakeData` creates 30 fake invoices (File menu → **Test data**). It does not run compiled or in a merged application. `launch_unitTest` replays the day-count tests.

### Requirements

- 4D 21 R4, project mode (`compatibilityVersion` 2140).
- GitHub access on first launch. 4D downloads the components declared in `Project/Sources/dependencies.json`: AJUI_Button 2.2.1, AJUI_Banner 1.9.0, AJUI_Tip 1.8.1, AJ_Math 2.1.1 (AJAR SA, MIT licence), 4D Widgets and 4D SVG (4D, "follow 4D version"), UI with Classes and SVG with Classes (vdelachaux).
- AJUI_BreadCrumb 1.3.0 (AJAR SA, MIT) ships as source in `Components/AJUI_BreadCrumb.4dbase/`.
- Optional, for development: 4DPop and 4DPop XLIFF Pro in `LocalComponents/` (not versioned, see [OUTILS-DEV.md](OUTILS-DEV.md)). Without them, 4D reports them as missing in the dependencies; the application still works.

### Installation

1. Clone the repository: `git clone https://github.com/AJARProject/Transitoires-4D.git`
2. Open `Project/transitoires.4DProject` with 4D 21 R4.
3. Create a new data file when 4D asks. No data file is versioned.
4. If 4D offers to import the components that used to ship inside 4D, choose **Ignore**.
5. In interpreted mode, an empty database is filled with the fake invoices at startup.
6. File menu → **Accruals and Deferrals**.

Documentation:

- [MIGRATION-21R4.md](MIGRATION-21R4.md): migration to 4D 21 R4.
- [I18N.md](I18N.md): multilingual fr/de/it/en interface.
- [RELEASE-NOTES.md](RELEASE-NOTES.md): release notes.
- [OUTILS-DEV.md](OUTILS-DEV.md): 4DPop and 4DPop XLIFF Pro development tools (optional).

### Licence

MIT, see [LICENSE](LICENSE). Components downloaded through `dependencies.json` keep their own licences.
