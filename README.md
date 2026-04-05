# Flatpak Packaging

This submodule contains the Flatpak packaging files for MIRA.

Included here:

- `solutions.bmogroup.mira.yml`
- `solutions.bmogroup.mira.desktop.in`
- `solutions.bmogroup.mira.metainfo.xml.in`
- `pypi-dependencies.json`
- `requirements-flatpak.txt`
- `256x256.png`
- `scalable.svg`
- `.github/workflows/flatpak.yml`

CI validation:

```bash
GitHub Actions builds the Flatpak manifest, verifies the exported app metadata,
and produces a `.flatpak` bundle artifact from this repository.
```
