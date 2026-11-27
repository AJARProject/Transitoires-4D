# Transitoires: translations to review / traductions à relire

Source: English. FR, DE and IT are first translations (Swiss register), marked `needs-review-translation` in the .xlf files.
Source : anglais. FR, DE et IT sont des premières traductions (registre suisse), marquées `needs-review-translation` dans les .xlf.
`{1}` = value inserted by the code / valeur insérée par le code. `&nbsp;` = non-breaking space / espace insécable.

## menus

| Key | EN | FR | DE | IT | Note |
|---|---|---|---|---|---|
| `trMenuTransitoires` | Accruals and Deferrals | Transitoires | Transitorische Posten | Ratei e risconti | Menu item that opens the Input window (was the French "Transitoire"). |
| `trMenuTestData` | Test data | Données de test | Testdaten | Dati di test | Menu item, calls DEV_seedFakeData (was the French "Données de test"). |
| `trMenuFile` | File | Fichier | Ablage | Archivio | Menu title (menu bar built by Menu_build). macOS names: DE Ablage, IT Archivio. |
| `trMenuEdit` | Edit | Édition | Bearbeiten | Modifica | Menu title. |
| `trMenuLanguage` | Language | Langue | Sprache | Lingua | Menu title of the Language menu. |
| `trMenuMode` | Mode | Mode | Modus | Modalità | Menu title (switch to Design). |
| `trMenuItemQuit` | Quit | Quitter | Beenden | Esci | Menu item, standard action quit (Cmd+Q). macOS moves it to the application menu. |
| `trMenuItemUndo` | Undo | Annuler | Widerrufen | Annulla | Menu item, standard action undo (Cmd+Z). |
| `trMenuItemCut` | Cut | Couper | Ausschneiden | Taglia | Menu item, standard action cut (Cmd+X). |
| `trMenuItemCopy` | Copy | Copier | Kopieren | Copia | Menu item, standard action copy (Cmd+C). |
| `trMenuItemPaste` | Paste | Coller | Einsetzen | Incolla | Menu item, standard action paste (Cmd+V). |
| `trMenuItemClear` | Clear | Effacer | Löschen | Elimina | Menu item, standard action clear. |
| `trMenuItemSelectAll` | Select All | Tout sélectionner | Alles auswählen | Seleziona tutto | Menu item, standard action selectAll (Cmd+A). |
| `trMenuItemShowClipboard` | Show Clipboard | Afficher le presse-papiers | Zwischenablage einblenden | Mostra Appunti | Menu item, standard action showClipboard. |
| `trMenuItemDesign` | Design | Développement | Designmodus | Design | Menu item, standard action design (back to the Design environment). |
| `trMenuLanguageAuto` | Automatic (system language) | Automatique (langue du système) | Automatisch (Systemsprache) | Automatica (lingua di sistema) | Language menu: follow the language of the system user (fr, de, it, en, otherwise English). |
| `trLanguageNameFr` | Français | Français | Français | Français | Language menu: name of the language in that language. Not translated. |
| `trLanguageNameDe` | Deutsch | Deutsch | Deutsch | Deutsch | Language menu: name of the language in that language. Not translated. |
| `trLanguageNameIt` | Italiano | Italiano | Italiano | Italiano | Language menu: name of the language in that language. Not translated. |
| `trLanguageNameEn` | English | English | English | English | Language menu: name of the language in that language. Not translated. |

## Input

| Key | EN | FR | DE | IT | Note |
|---|---|---|---|---|---|
| `trInputWindowTitle` | Accruals and Deferrals | Transitoires | Transitorische Posten | Ratei e risconti | Window title of the Input form (31 characters max). Was "window title". |
| `trInputHeaderInvoice` | Invoice | Facture | Rechnung | Fattura | List box header. |
| `trInputHeaderDate` | Date | Date | Datum | Data | List box header (80 px). |
| `trInputHeaderStart` | Start | Début | Beginn | Inizio | List box header (80 px). |
| `trInputHeaderEnd` | End | Fin | Ende | Fine | List box header (80 px). |
| `trInputHeaderAmountInvoiced` | Amount invoiced | Montant facturé | Rechnungsbetrag | Importo fatturato | List box header. |
| `trInputHeaderRate` | Rate | Taux | Kurs | Cambio | List box header: exchange rate. |
| `trInputHeaderAmountPaid` | Amount paid | Montant payé | Bezahlter Betrag | Importo pagato | List box header (was "amount payed"). |
| `trInputHeaderDaysCurrentYear` | Days current year | Jours année en cours | Tage laufendes Jahr | Giorni anno corrente | List box header. |
| `trInputHeaderDaysNextYear` | Days next year | Jours année suivante | Tage Folgejahr | Giorni anno successivo | List box header. |
| `trInputHeaderAmountCurrentYear` | Amount this year | Montant année en cours | Betrag laufendes Jahr | Importo anno corrente | List box header. |
| `trInputHeaderAmountNextYear` | Amount next year | Montant année suivante | Betrag Folgejahr | Importo anno successivo | List box header. |
| `trInputPhInvoiceRef` | Invoice reference | Référence facture | Rechnungsnummer | Riferimento fattura | Placeholder and floating label (145 px). |
| `trInputPhStartDate` | Start date | Date de début | Beginndatum | Data d'inizio | Placeholder and floating label (115 px). |
| `trInputPhEndDate` | End date | Date de fin | Enddatum | Data di fine | Placeholder and floating label (115 px). |
| `trInputPhAmountInvoiced` | Amount invoiced | Montant facturé | Rechnungsbetrag | Importo fatturato | Placeholder and floating label (115 px). |
| `trInputPhAmountPaid` | Amount paid | Montant payé | Bezahlter Betrag | Importo pagato | Placeholder and floating label (115 px). Was "Amount payed". |
| `trInputPhRate` | Rate | Taux | Kurs | Cambio | Placeholder and floating label (115 px): exchange rate. |
| `trInputPhInvoiceDate` | Invoice date | Date de facture | Rechnungsdatum | Data fattura | Placeholder and floating label (115 px). |
| `trInputDiscount` | Discount | Rabais | Rabatt | Sconto | Static text (66 px). |
| `trInputFilters` | Filters | Filtres | Filter | Filtri | Static text, class Title2 (155 px). |
| `trTipSave` | Save | Enregistrer | Speichern | Salva | Tooltip of the save button. |
| `trTipAddLine` | Add a new line | Ajouter une ligne | Neue Zeile hinzufügen | Aggiungi una riga | Tooltip. |
| `trTipDeleteLineOne` | Delete the invoice line | Supprimer la ligne de facture | Rechnungszeile löschen | Elimina la riga della fattura | Tooltip, one selected line. |
| `trTipDeleteLineOther` | Delete the invoice lines | Supprimer les lignes de facture | Rechnungszeilen löschen | Elimina le righe della fattura | Tooltip, several selected lines. |
| `trTipNoTypeFilter` | No debit/credit filter | Aucun filtre débit/crédit | Kein Debit-/Kreditfilter | Nessun filtro debito/credito | Tooltip (was "No Credit Debit Filters "). |
| `trTipNoCurrencyFilter` | No currency filter | Aucun filtre de devise | Kein Währungsfilter | Nessun filtro valuta | Tooltip (was "No currency filters"). |
| `trTipPrintSelection` | Print the selection | Imprimer la sélection | Auswahl drucken | Stampa la selezione | Tooltip (was "Print Selection"). |
| `trTipReloadLine` | Reload the invoice line | Recharger la ligne de facture | Rechnungszeile neu laden | Ricarica la riga della fattura | Tooltip. |
| `trTipCalcDiscount` | Calculate the discount | Calculer le rabais | Rabatt berechnen | Calcola lo sconto | Tooltip (was "Calc Discount"). |
| `trTipSearchHelp` | Start/End: 01.01.20...05.05.20  Date: 01.01&05.05 | Début/Fin&nbsp;: 01.01.20...05.05.20  Date&nbsp;: 01.01&05.05 | Beginn/Ende: 01.01.20...05.05.20  Datum: 01.01&05.05 | Inizio/Fine: 01.01.20...05.05.20  Data: 01.01&05.05 | Tooltip of the search help button (190 px wide). The patterns ... and & must stay as they are: the search code parses them. |
| `trTipSearchPicker` | Invoice ref. or date | Réf. facture ou date | Rechnungsnr. oder Datum | Rif. fattura o data | Help text inside the 4D Widgets search field. |
| `trTipProtected` | Protected: click to unprotect | Protégée&nbsp;: cliquer pour retirer la protection | Geschützt: klicken, um den Schutz aufzuheben | Protetta: cliccare per rimuovere la protezione | Tooltip of the lock button when the invoice is protected (was the button label "Protect-Unprotect"). |
| `trTipUnprotected` | Not protected: click to protect | Non protégée&nbsp;: cliquer pour protéger | Nicht geschützt: klicken, um zu schützen | Non protetta: cliccare per proteggere | Tooltip of the lock button when the invoice is not protected (was the button label "Unprotect-Protect"). |
| `trMenuLockSelection` | Lock selection | Protéger la sélection | Auswahl schützen | Proteggi la selezione | Context menu of the list. |
| `trMenuUnlockSelection` | Unlock selection | Retirer la protection de la sélection | Schutz der Auswahl aufheben | Rimuovi la protezione dalla selezione | Context menu of the list. |
| `trMenuDeleteSelection` | Delete selection | Supprimer la sélection | Auswahl löschen | Elimina la selezione | Context menu of the list. |
| `trRibbonNoFilter` | No filter | Aucun filtre | Kein Filter | Nessun filtro | Corner ribbon (200 px, 18 pt bold). |
| `trRibbonLocked` | Locked | Protégée | Geschützt | Protetta | Corner ribbon on a protected invoice (165 px, 20 pt bold). |

## print_form

| Key | EN | FR | DE | IT | Note |
|---|---|---|---|---|---|
| `trPrintHeaderDate` | Date | Date | Datum | Data | Print header (90 px). |
| `trPrintHeaderInvoice` | Invoice | Facture | Rechnung | Fattura | Print header (120 px). |
| `trPrintHeaderStart` | Start | Début | Beginn | Inizio | Print header (90 px). |
| `trPrintHeaderEnd` | End | Fin | Ende | Fine | Print header (90 px). |
| `trPrintHeaderTotal` | Total | Total | Total | Totale | Print header (90 px). |
| `trPrintHeaderRate` | Rate | Taux | Kurs | Cambio | Print header (70 px). |
| `trPrintHeaderPaid` | Paid | Payé | Bezahlt | Pagato | Print header (90 px). Was "Payed". |
| `trPrintHeaderDays` | Days | Jours | Tage | Giorni | Print header in the form; replaced at run time by trPrintHeaderDaysYear. |
| `trPrintHeaderAmount` | Amount | Montant | Betrag | Importo | Print header in the form; replaced at run time by trPrintHeaderAmountYear. |
| `trPrintHeaderDaysYear` | Days ({1}) | Jours ({1}) | Tage ({1}) | Giorni ({1}) | {1} = year. Print header (90 px). |
| `trPrintHeaderAmountYear` | Amount ({1}) | Montant ({1}) | Betrag ({1}) | Importo ({1}) | {1} = year. Print header (100 px). |
| `trPrintFooterTotal` | Total | Total | Total | Totale | Footer of the date column. |
| `trPrintSummary` | Summary - {1} | Récapitulatif - {1} | Übersicht - {1} | Riepilogo - {1} | Print title. {1} = filters (type, currency, year). |
| `trPrintPage` | Page {1} | Page {1} | Seite {1} | Pagina {1} | {1} = page number. |

## messages

| Key | EN | FR | DE | IT | Note |
|---|---|---|---|---|---|
| `trBtnYes` | Yes | Oui | Ja | Sì | CONFIRM button. |
| `trBtnNo` | No | Non | Nein | No | CONFIRM button. |
| `trBtnAdd` | Add | Ajouter | Hinzufügen | Aggiungi | CONFIRM button (test data). |
| `trBtnCancel` | Cancel | Annuler | Abbrechen | Annulla | CONFIRM button (test data). |
| `trMsgStartAfterEnd` | The start date must be earlier than the end date. | La date de début doit être antérieure à la date de fin. | Das Beginndatum muss vor dem Enddatum liegen. | La data d'inizio deve precedere la data di fine. | ALERT (start_value, end_value). |
| `trMsgSelectInvoice` | Select an invoice. | Sélectionnez une facture. | Wählen Sie eine Rechnung aus. | Selezionare una fattura. | ALERT. |
| `trMsgProtectedOne` | This invoice is protected and cannot be deleted. | Cette facture est protégée, elle ne peut pas être supprimée. | Diese Rechnung ist geschützt und kann nicht gelöscht werden. | Questa fattura è protetta e non può essere eliminata. | ALERT (was in French in the code). |
| `trMsgProtectedOther` | These invoices are protected and cannot be deleted. | Ces factures sont protégées, elles ne peuvent pas être supprimées. | Diese Rechnungen sind geschützt und können nicht gelöscht werden. | Queste fatture sono protette e non possono essere eliminate. | ALERT (was in French in the code). |
| `trConfirmDeleteInvoice` | Do you want to delete the invoice {1}? | Voulez-vous supprimer la facture {1}&nbsp;? | Möchten Sie die Rechnung {1} löschen? | Eliminare la fattura {1}? | CONFIRM. {1} = invoice reference. |
| `trConfirmDeleteSelection` | Do you want to delete the selection? | Voulez-vous supprimer la sélection&nbsp;? | Möchten Sie die Auswahl löschen? | Eliminare la selezione? | CONFIRM. |
| `trMsgProtectedKeptOne` | {1} protected invoice was kept. | {1} facture protégée a été conservée. | {1} geschützte Rechnung wurde beibehalten. | {1} fattura protetta è stata mantenuta. | ALERT, singular. {1} = count. Was "facture(s) protégée(s) conservée(s)". |
| `trMsgProtectedKeptOther` | {1} protected invoices were kept. | {1} factures protégées ont été conservées. | {1} geschützte Rechnungen wurden beibehalten. | {1} fatture protette sono state mantenute. | ALERT, plural. {1} = count. |
| `trMsgInvoiceDeletedOne` | Invoice deleted. | Facture supprimée. | Rechnung gelöscht. | Fattura eliminata. | ALERT, singular. |
| `trMsgInvoiceDeletedOther` | {1} invoices deleted. | {1} factures supprimées. | {1} Rechnungen gelöscht. | {1} fatture eliminate. | ALERT, plural. {1} = count (was "Invoices deleted"). |
| `trMsgNotDeletedOne` | {1} invoice was not deleted. | {1} facture n'a pas été supprimée. | {1} Rechnung wurde nicht gelöscht. | {1} fattura non è stata eliminata. | ALERT, singular. {1} = count. |
| `trMsgNotDeletedOther` | {1} invoices were not deleted. | {1} factures n'ont pas été supprimées. | {1} Rechnungen wurden nicht gelöscht. | {1} fatture non sono state eliminate. | ALERT, plural. {1} = count. |
| `trConfirmSaveInvoice` | Do you want to save the invoice {1}? | Voulez-vous enregistrer la facture {1}&nbsp;? | Möchten Sie die Rechnung {1} speichern? | Salvare la fattura {1}? | CONFIRM. {1} = invoice reference. |
| `trMsgSaveFailed` | Error: the invoice cannot be edited. | Erreur&nbsp;: la facture ne peut pas être modifiée. | Fehler: Die Rechnung kann nicht bearbeitet werden. | Errore: la fattura non può essere modificata. | ALERT when save() fails. |
| `trMsgUnknownUUID` | Unknown UUID. | UUID inconnu. | Unbekannte UUID. | UUID sconosciuto. | ALERT (was "Unknow UUID"). |
| `trConfirmLockInvoices` | Do you want to lock {1} invoices? They will be saved automatically. | Voulez-vous protéger {1} factures&nbsp;? Elles seront enregistrées automatiquement. | Möchten Sie {1} Rechnungen schützen? Sie werden automatisch gespeichert. | Proteggere {1} fatture? Verranno salvate automaticamente. | CONFIRM, only shown for 2 invoices or more. {1} = count. |
| `trConfirmUnlockInvoices` | Do you want to unlock {1} invoices? They will be saved automatically. | Voulez-vous retirer la protection de {1} factures&nbsp;? Elles seront enregistrées automatiquement. | Möchten Sie den Schutz von {1} Rechnungen aufheben? Sie werden automatisch gespeichert. | Rimuovere la protezione da {1} fatture? Verranno salvate automaticamente. | CONFIRM, only shown for 2 invoices or more. {1} = count. |
| `trMsgLockFailed` | One or more invoices were not saved correctly. | Une ou plusieurs factures n'ont pas été enregistrées correctement. | Eine oder mehrere Rechnungen wurden nicht korrekt gespeichert. | Una o più fatture non sono state salvate correttamente. | ALERT (was "One or more invoices not edited correctly"). |
| `trMsgSeedCompiledOnly` | Test data can only be created in an interpreted database. | Les données de test ne peuvent être créées que dans une base interprétée. | Testdaten können nur in einer interpretierten Datenbank erstellt werden. | I dati di test possono essere creati solo in un database interpretato. | ALERT from the Test data menu in a compiled or built application. |
| `trConfirmSeedNotEmpty` | The invoice table is not empty. Add the test invoices anyway? | La table des factures n'est pas vide. Ajouter quand même les factures de test&nbsp;? | Die Rechnungstabelle ist nicht leer. Testrechnungen trotzdem hinzufügen? | La tabella delle fatture non è vuota. Aggiungere comunque le fatture di test? | CONFIRM from the Test data menu. |
| `trMsgSeedCreatedOne` | {1} test invoice created. | {1} facture de test créée. | {1} Testrechnung erstellt. | {1} fattura di test creata. | ALERT, singular. {1} = count. |
| `trMsgSeedCreatedOther` | {1} test invoices created. | {1} factures de test créées. | {1} Testrechnungen erstellt. | {1} fatture di test create. | ALERT, plural. {1} = count (0 uses this form too). |
| `trConfirmReopenWindows` | The Transitoires window must be reopened to show the new language. Changes that have not been saved will be lost. | La fenêtre Transitoires doit être rouverte pour afficher la nouvelle langue. Les modifications non enregistrées seront perdues. | Das Fenster Transitorische Posten muss neu geöffnet werden, um die neue Sprache anzuzeigen. Nicht gespeicherte Änderungen gehen verloren. | La finestra Ratei e risconti deve essere riaperta per mostrare la nuova lingua. Le modifiche non salvate andranno perse. | CONFIRM after a language change (Input_reopenAll). Later: the window is translated the next time it opens. |
| `trBtnReopenNow` | Reopen now | Rouvrir maintenant | Jetzt neu öffnen | Riapri ora | CONFIRM button. |
| `trBtnLater` | Later | Plus tard | Später | Più tardi | CONFIRM button. |
| `trMsgLanguageNotSaved` | The language choice could not be saved. It applies until 4D is closed. | Le choix de la langue n'a pas pu être enregistré. Il s'applique jusqu'à la fermeture de 4D. | Die Sprachwahl konnte nicht gespeichert werden. Sie gilt bis zum Beenden von 4D. | Non è stato possibile salvare la scelta della lingua. Vale fino alla chiusura di 4D. | ALERT when the preference file cannot be written (Language_saveChoice). |

## values

| Key | EN | FR | DE | IT | Note |
|---|---|---|---|---|---|
| `trValueDebit` | Debit | Débit | Debit | Debito | Display of the stored value "debit" (breadcrumb, ribbon, print title). |
| `trValueCredit` | Credit | Crédit | Kredit | Credito | Display of the stored value "credit". |
| `trValueCurrencyCHF` | CHF | CHF | CHF | CHF | Display of the stored currency value "Frs". Not translated. |
