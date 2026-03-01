# AGENTS.md

This document provides guidelines, commands, and patterns to help AI agents work effectively in this repository.

## Project Overview
This repository contains a static personal blog/website generated using [Hugo](https://gohugo.io/). 

- **Configuration:** The main configuration file is `hugo.yaml`.
- **Theme:** Uses the `PaperMod` theme (included as a git submodule in `themes/PaperMod`).
- **Content:** Markdown posts are stored in `content/posts/`. Other pages are in `content/` directly (e.g., `about.md`, `projects.md`).
- **Static Assets:** Images and other static files belong in `static/` and `static/images/`.
- **Custom CSS:** Located in `assets/css/extended/custom.css`.
- **Task Runner:** Uses [Task](https://taskfile.dev/) (`Taskfile.yml`) to manage common operations.

## Essential Commands (via Taskfile)
Instead of running raw `hugo` commands, this project uses `task` for operations:
- **Run local server:** `task serve` (runs `hugo server --buildDrafts --buildFuture --disableFastRender`)
- **Build site:** `task build` (builds the site for production with `--gc --minify`)
- **Create new post:** `task new posts/title-of-post.md` (creates a new markdown file)
- **Clean build artifacts:** `task clean` (removes `public/` and `resources/_gen`)

## Code Organization and Conventions
- **Filename Convention:** Blog posts in `content/posts/` generally use a hyphen-separated title slug (e.g., `title-of-post.md`). There is no strict date-prefix requirement for the filename itself.
- **Frontmatter format:** YAML frontmatter is commonly used, though TOML may appear in archetypes (`date = '...'`).
- **Frontmatter Dates:** Every post must have a `date` field in its frontmatter to be ordered properly. 
- **Multiple URLs per Post:** If a post needs to be accessible from multiple paths (e.g., for legacy reasons), use the `aliases` array in the frontmatter.
  ```yaml
  aliases:
    - /legacy-path
    - /YYYY/MM/DD/legacy-path
  ```
- **Drafts:** Set `draft = true` (TOML) or `draft: true` (YAML) in the frontmatter to prevent a post from being published.
- **Tool Versions:** The project uses `hugo 0.157.0`, `task`, and `python` as specified in `.tool-versions` (managed via tools like `asdf` or `mise`).
- **Scripting:** When running or creating scripts to automate tasks in the repository, use either standard bash/shell commands or the `python` version explicitly made available in `.tool-versions`.

## Testing Approach
- To test changes or formatting, run `task serve` locally and view the generated pages. Ensure there are no broken links and that the markdown renders correctly with the `PaperMod` theme.
- The `hugo` CLI provides immediate feedback on template or syntax errors when running the server or building.

## Gotchas and Important Patterns
- **Features enabled:** The site supports Math rendering (via Goldmark passthrough), has a search feature powered by fuse.js (requires JSON output format), and generates an `llms.txt` file for LLM scraping.
- **PaperMod Customization:** If modifying the theme, prefer using Hugo's overlay mechanism by placing files in `layouts/` or `assets/` at the root, rather than modifying files inside `themes/PaperMod/` directly (since it's a git submodule).
- **Submodules:** The theme is tracked via Git submodules (`.gitmodules`). Don't commit directly to the submodule folder.
