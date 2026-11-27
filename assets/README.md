# Game assets

Asset scaffold for a web game. The workspace currently contains plain HTML and
CSS, so this structure does not assume a particular engine or rendering
framework. Model, texture, audio, and font folders are ready for production
files; `manifest.json` demonstrates an engine-neutral asset registry.

## Folder layout

- `models/`: 3D models in `.glb` or `.gltf`, grouped by characters,
  environment, props, and weapons.
- `textures/`: material maps, UI sprites, and tilemaps. Keep maps in their
  corresponding folders.
- `audio/`: background music, sound effects, UI sounds, and ambient audio.
- `shaders/`: custom GLSL source files. Match shader language/version and
  uniforms to the renderer when integrating.
- `fonts/bitmap/`: bitmap fonts and atlases; `fonts/web/`: web font files such
  as `.woff2` or `.ttf`.
- `data/`: JSON game configuration grouped by characters, items, recipes, and
  maps/waves.

## Naming convention

- Use lowercase `snake_case`; do not use spaces, accents, or ambiguous
  abbreviations.
- Prefix files by asset type: `mdl_` (model), `tex_` (texture), `aud_` (audio),
  `shd_` (shader), `fnt_` (font), and `dat_` (JSON data).
- Include a descriptive subject after the prefix, for example
  `mdl_player.glb`, `aud_menu_theme.ogg`, or `dat_items.json`.
- Use the texture-map suffixes `_diff` (albedo/diffuse), `_norm` (normal), and
  `_rough` (roughness) before the extension. Keep map files for the same
  material on the same base name, e.g. `tex_stone_diff.png`,
  `tex_stone_norm.png`, and `tex_stone_rough.png`.
- Use stable, unique manifest IDs in dot-separated lowercase form (for
  example, `character.player`); paths are relative to the `assets/` directory.
- Keep file extensions meaningful and consistent. Do not reuse an ID for a
  different asset when replacing content.

## Manifest

`manifest.json` contains an `assets` array with a unique `id`, a path relative
to this directory, a `type`, and a `preload` boolean for each registered file.
The sample only lists files included in this scaffold; add an entry when its
referenced file exists. The consuming loader should resolve paths from the
manifest's directory and handle each `type` appropriately.
