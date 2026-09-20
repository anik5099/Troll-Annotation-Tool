# Chihna — Bengali Troll Meme Annotator

A local, offline-first browser application for annotating Bengali memes for:

1. Troll detection: `troll`, `non_troll`
2. Target identification: 4 target categories plus optional canonical identity
3. Trolling mechanism: DRD, CSR, IDF, PBT
4. Structured explanation generation

## Recommended launch

Use a current desktop version of Chrome or Edge. Run the app from `localhost`; this enables the browser's user-authorized File System Access API.

### Windows

Double-click `start-windows.bat`. If `py` is unavailable, install Python 3 or run:

```powershell
python -m http.server 8765
```

Then open `http://localhost:8765/bangla-troll-annotator.html`.

### Linux / macOS

```bash
chmod +x start-unix.sh
./start-unix.sh
```

Or manually run `python3 -m http.server 8765` and open the URL above.

## First use

1. Enter the project name and annotator ID.
2. Select the directory containing memes. Nested subdirectories are supported.
3. Grant read/write access when the browser asks.
4. Annotate and use **Save & next**. The application creates `troll_annotations.json` in the selected root directory.

## Resume

Reopen the app and choose **Reconnect saved folder**. Browsers can require permission again after a restart. The app loads `troll_annotations.json`, returns to its recorded checkpoint, and restores completed, skipped, and draft records.

If a browser does not support direct directory writing, the app switches to compatibility mode. Re-select the same folder and use **Export JSON** regularly. A recovery copy is maintained in IndexedDB.

## Controls

- `Ctrl + Enter`: validate, save, and move to the next unfinished image
- `Left` / `Right`: previous or next image
- `S`: open skip dialog
- `B`: browse/search/filter dataset
- `0`: fit image
- Mouse wheel: zoom
- Drag image: pan
- Double-click image: fit
- `?`: shortcut guide

## Data safety

- Completed and skipped records are written to `troll_annotations.json` after each action in direct-write mode.
- Draft fields are cached in IndexedDB while typing.
- **Export JSON** creates a manual backup at any time.
- **Import JSON** restores matching records into the currently opened image directory.
- Image filename and relative path are included in each record.
- The checkpoint stores the current index, filename, totals, annotation count, and skip count.

## Supported images

PNG, JPEG, WebP, GIF, BMP, and AVIF. Images are discovered recursively and naturally sorted by relative path.

## Notes

- The mechanism field is required only for troll memes; non-troll memes receive `null` with `applicable: false`.
- Explanation components are annotation structure, not additional benchmark tasks. They assemble into an editable final explanation.
- Review the target ontology and wording with annotators during the pilot before freezing the schema.
