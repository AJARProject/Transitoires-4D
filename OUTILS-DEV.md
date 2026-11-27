# Outils de développement : 4DPop et 4DPop XLIFF Pro

[English summary](#english-summary) at the end.

Ces deux composants servent uniquement au développement. Transitoires fonctionne sans eux : ils ne sont ni appelés par le code de l'application ni nécessaires à l'utilisateur final.

**Prérequis** : 4D 21 R4, mode projet, Mac Apple Silicon. Les composants livrés ne contiennent que la bibliothèque `lib4d-arm64.dylib`.

---

## Les composants

### 4DPop
**4DPop** est la palette d'outils de Vincent de Lachaux ([vdelachaux/4DPop](https://github.com/vdelachaux/4DPop)). C'est une barre d'icônes, affichée dans l'environnement de développement, qui lance les autres outils 4DPop.

### 4DPop XLIFF Pro
**4DPop XLIFF Pro** est l'éditeur de fichiers XLIFF de la même famille ([vdelachaux/4DPop-XLIFF-Pro](https://github.com/vdelachaux/4DPop-XLIFF-Pro)). Il sert à modifier `Resources/<langue>.lproj/Transitoires.xlf`, les textes de l'interface en fr, de, it et en. Voir aussi [I18N.md](I18N.md).

### Versions utilisées
Ce sont des portages 4D 21 R4 (branche `fixes/21R4`), avec des corrections qui ne sont pas encore reprises en amont.

| Composant | Branche | Commit | SHA-1 du `.4DZ` |
|---|---|---|---|
| 4DPop | `fixes/21R4` | `ba84efd` | `ea93003fe478ba69038c6dbe1df1214bf232f035` |
| 4DPop XLIFF Pro | `fixes/21R4` | `92565e6` | `98e84ed4a08c44e3bc510b66bc1c1a70c89c14f1` |

4DPop XLIFF Pro `92565e6` contient la correction **B38**, décrite plus bas.

---

## Installation

### Ce qui est versionné
- `environment4d.json` : déclare les deux composants locaux, `./LocalComponents/4DPop.4dbase` et `./LocalComponents/4DPop XLIFF Pro.4dbase`.
- `Project/Sources/dependencies.json` : ajoute les entrées `4DPop` et `4DPop XLIFF Pro`, qui sont résolues par `environment4d.json`.
- `Project/Sources/dependencies.json` : ajoute aussi les dépendances GitHub des deux composants, `UI with Classes` et `SVG with Classes` (vdelachaux). Le gestionnaire de dépendances de 4D les télécharge.
- `Project/Sources/settings.4DSettings` : `<general execute_host_database_event="true"/>`. Ce réglage permet à 4DPop d'exécuter sa méthode « Sur événement base hôte », qui affiche la palette après l'ouverture du projet.
- `Project/Sources/Methods/launch4DPop.4dm` : rouvre la palette à la main, par `EXECUTE METHOD("4DPop_Palette")`.

### Ce qui n'est pas versionné
Le dossier `LocalComponents/`, qui contient les composants compilés (environ 2,2 Mo pour 4DPop et 2,7 Mo pour XLIFF Pro), est ignoré par `.gitignore`.

Pour l'installer, 4D fermé :
1. Copier `4DPop.4dbase` et `4DPop XLIFF Pro.4dbase` dans `LocalComponents/` à la racine du projet.
2. Vérifier les empreintes avec la commande ci-dessous. Elles doivent correspondre au tableau.

```sh
shasum "LocalComponents/4DPop.4dbase/Contents/4DPop.4DZ" \
       "LocalComponents/4DPop XLIFF Pro.4dbase/Contents/4DPop XLIFF Pro.4DZ"
```

Les builds ne sont pas fournis dans ce dépôt.

Sans `LocalComponents/`, 4D signale les deux composants comme introuvables dans le panneau des dépendances. Transitoires n'en a pas besoin pour fonctionner.

### Licence
4DPop et 4DPop XLIFF Pro sont sous **licence MIT** (© 2026 vdelachaux). Les copier et les redistribuer est permis, à condition de joindre la notice de copyright et le texte de la licence. Ces deux éléments se trouvent dans le fichier `LICENSE` de chaque dépôt.

---

## Utilisation

### Lancer la palette
Avec `execute_host_database_event="true"`, la palette 4DPop s'affiche après l'ouverture du projet en mode développement.

Si elle a été fermée, exécuter la méthode **`launch4DPop`**, par exemple depuis l'explorateur de méthodes.

### Lancer 4DPop XLIFF Pro
Cliquer sur l'icône XLIFF Pro dans la palette 4DPop.

Au premier lancement, un assistant demande :
- la **langue de référence**, c'est-à-dire la langue source des fichiers ;
- les **langues cibles**.

Le choix est enregistré dans `Preferences/4DPop XLIFF.settings`, à la racine du projet, sous les clés `sourceLanguage` et `targetLanguages`.

Pour Transitoires, la langue de référence est **English (en)**. Les quatre fichiers déclarent `source-language="en"`. Les langues cibles sont de, fr et it.

### Règle de choix de la langue de référence (correction B38)
XLIFF Pro détermine la langue de référence dans cet ordre :
1. la préférence `sourceLanguage` enregistrée par l'assistant, si le dossier `<langue>.lproj` existe ;
2. sinon, l'attribut `source-language` déclaré le plus souvent par les fichiers `.xlf` des dossiers `.lproj` ;
3. sinon, la langue du système, puis la langue courante du projet, puis l'anglais, puis le premier dossier `.lproj` trouvé.

L'assistant revient seulement dans deux cas : la langue enregistrée n'a plus de dossier, ou les langues cibles ont changé.

Avant `92565e6`, la langue du système passait en premier, et la préférence n'était jamais relue (`_Editor.4dm`, `get mainLanguage`). Sur un Mac en français (fr-CH), voici ce qui se passait :
- L'assistant proposait le français.
- Le choix « English » était enregistré, puis comparé à « fr » au lancement suivant (`EDITOR OPEN.4dm`).
- L'assistant revenait alors à chaque lancement, en reproposant le français.

### Forcer le choix de la langue de référence (touche Maj)
Pour rouvrir l'assistant alors que des préférences sont déjà enregistrées :
1. Fermer la fenêtre de XLIFF Pro si elle est ouverte.
2. Maintenir **Maj** (Shift) enfoncée en cliquant sur l'icône XLIFF Pro de la palette 4DPop, jusqu'à ce que l'assistant s'ouvre.
3. Choisir **English** comme langue de référence. de, fr et it deviennent les langues cibles.
4. Valider. Le choix remplace l'ancien dans `Preferences/4DPop XLIFF.settings`, et l'assistant ne s'ouvre plus aux lancements suivants.

**Attention** : la touche Maj efface aussi la géométrie des fenêtres mémorisée par 4D pour le projet, c'est-à-dire le dossier `4D Window Bounds v21` des préférences utilisateur 4D. Les fenêtres retrouvent leur taille et leur position par défaut.

Dans le code de XLIFF Pro `92565e6`, `Project/Sources/Methods/EDITOR OPEN.4dm` :
- lignes 20 à 22 : `If (Shift down)` lance `deleteGeometry()` ;
- ligne 31 : `If ($runWizard) | Shift down` ouvre l'assistant.

**Autre méthode** : 4D fermé, supprimer `Preferences/4DPop XLIFF.settings`. Au lancement suivant, l'assistant s'ouvre et propose l'anglais, la langue déclarée par les fichiers.

### Fichiers .xlf réécrits par XLIFF Pro
À l'enregistrement, XLIFF Pro réécrit les fichiers `.xlf` avec son propre format :
- l'en-tête devient `standalone="no"` ;
- l'indentation est faite d'espaces au lieu de tabulations.

Le contenu reste le même : mêmes unités, sources, cibles, notes et attributs. Avant de committer, vérifier avec `git diff` qu'au moins une traduction a changé. Si seule la mise en forme a changé, ne pas committer les fichiers. Pour contrôler les fichiers, voir `i18n/check_xliff.py` dans [I18N.md](I18N.md).

---

## English summary

- **4DPop** (tool palette) and **4DPop XLIFF Pro** (XLIFF editor), both by vdelachaux under the MIT licence, are development-only components. They need 4D 21 R4 on Apple Silicon.
- The builds used are 21 R4 ports on branch `fixes/21R4`: 4DPop `ba84efd` (4DZ `ea93003f…`) and XLIFF Pro `92565e6` (4DZ `98e84ed4…`).
- `environment4d.json`, `dependencies.json`, `settings.4DSettings` (`execute_host_database_event`) and the `launch4DPop` method are versioned.
- The compiled components in `LocalComponents/` are not versioned (git-ignored). Copy them there and check the SHA-1 values.
- **Reference language (fix B38)**: the order is the saved preference, then the `source-language` declared by the `.xlf` files, then the system language. For Transitoires, choose **English**.
- **To force the wizard**, hold **Shift** while clicking the XLIFF Pro icon. This also resets the saved window geometry (`EDITOR OPEN.4dm` lines 20-22 and 31). The other way is to delete `Preferences/4DPop XLIFF.settings` while 4D is closed.
