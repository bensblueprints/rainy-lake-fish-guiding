# Rainy Lake Fish Guiding

**Status:** 🔄 In Progress — design v2 (local prototype)
**Type:** Website redesign (speculative / pitch)
**Hosted:** ❌ Not deployed — local-only prototype at `C:\Users\HP\Documents\working\Projects\Rainy Lake Fish Guiding\index.html`. Not on [[Contabo VPS 2 - Coolify|Coolify]], not on Netlify yet. Candidate for Coolify once pitch is accepted (shared API token `9|leesferry2026`).
**URL (source):** https://www.rainylakefishguiding.com/
**URL (inspiration):** https://rainylake.org/
**Started:** 2026-04-24

---

## Overview

Redesign of **Full Throttle Guiding** — Cody Christensen's fishing-guide business on Rainy Lake / Rainy River, MN. Existing site is a 2017-era Weebly template; goal is an editorial outdoor-magazine aesthetic on the level of the regional tourism board site ([rainylake.org](https://rainylake.org/)).

### Client snapshot
- **Guide:** Captain Cody Christensen — USCG licensed, 32 seasons
- **Phone:** 218-240-2091
- **Boat:** 2021 Ranger 1880 · 200hp Yamaha
- **Tackle:** Fenwick rods, Pflueger President reels (provided)
- **Species:** Walleye, smallmouth, crappie, northern, muskie, sturgeon, lake trout (surrounding waters)
- **Rates:** $550 (2) / $625 (3) / $675 (4) full day + bait & fuel; $550 all-inclusive spring sturgeon
- **Add-ons:** Follow boat $50, shore lunch $20/pp, boat rental $375-450

## Design direction

- **Aesthetic:** Editorial outdoor-magazine — think Filson × NYT Travel × Garden & Gun
- **Typography:** Fraunces (display, variable optical sizing) + Instrument Serif (italic accents) + Instrument Sans (body)
- **Palette:** Ivory `#f3ede1` / Deep lake `#16333c` / Lake abyss `#0b1e24` / Moss `#3d5a3c` / Brass `#b98a3c` / Rust `#8a3a1c`
- **Motifs:** Numbered sections (§ 01…§ 07), pull quotes, stats strip, species card grid, gallery scroll-track, oversized "CODY" watermark behind guide bio, grain overlay, mix-blend-difference nav
- **Motion:** Subtle hero drift, scroll-reveal, hover-zoom on species imagery

## Deliverables

- [x] Scrape source site (22 images via WebFetch + curl batch for 40+ scenery gallery originals via [[Website Redesign Skill|web-grabber]])
- [x] Analyze `rainylake.org` visual language
- [x] Single-page HTML/CSS prototype — `index.html` in this folder
- [x] Asset library — `assets/` folder with all source images
- [ ] Convert to Next.js 14 + Tailwind + shadcn (Phase 3 of [[Website Redesign Skill]])
- [ ] Lead-booking form via Netlify Functions
- [ ] Deploy to Netlify
- [ ] Pitch to Cody

## Progress log

### 2026-04-24
- Scraped full site (home, book-a-fishing-trip, meet-your-guide, fish-gallery, testimonials, contact, scenery, book) — 60+ image URLs collected
- Ran `web-grabber grab` (httpx mode, depth 5) → only 1 HTML + 8 images (Weebly JS-nav defeated the crawler); output saved to `web-grabber-scrape/`
- Supplemented with a `curl` batch over the known Weebly `_orig.jpg` URL pattern (40+ scenery originals) → `assets/` now holds 63 images
- Added findings + selenium/camoufox workaround to [[Website Redesign Skill]]

### 2026-04-25
- User flagged: per-species galleries on source site (walleye, bass, muskie, northern-pike, crappie, sturgeon, trout) weren't being pulled
- Scraped all 7 species gallery pages + parallel-downloaded **257 unique fish photos** into `assets/gallery/<species>/` (xargs -P 20 over ~512 URL variants; thumbnails listed twice in source HTML → each image attempted as `_orig` + plain)
- Built `manifest.js` mapping species → image list for runtime loading
- Added **§ 02½ Catches** section with species tabs, lazy-loaded 24-at-a-time grid, "Load more" pagination, and a full-screen lightbox (keyboard nav, esc to close)
- Added **§ 08 Booking** section with an editorial form: name / party / email / phone / date / species / notes → Netlify Forms wired (`data-netlify="true"`), with local-file fallback success state
- Hero polish: rotated "EST. 1993 · USCG LICENSED · RAINY LAKE MN" side badge; added "Book" nav link
- Confirmed: **not deployed** — lives locally only. When pitch lands, deploy to [[Contabo VPS 2 - Coolify|Coolify]] alongside [[Lees Ferry On The Fly]] / [[Ashokan Outdoors]] / [[Ten 2 Ten Stereo]] / [[The Beach Bowl]].
- Built single-file `index.html` prototype with seven editorial sections: Prologue, Quarry, Trips & Rates, The Guide, Field Notes gallery, Praise, The Place, book CTA
- All copy pulled verbatim from scrape, lightly re-sectioned for editorial rhythm
- Added `web-grabber` to [[Website Redesign Skill]] as Phase-1 standard tooling

---

## Related

- [[All Netlify Sites]]
- [[All Sites|Clients/All Sites]]
- [[Website Redesign Skill]]
- [[Fort Langley Fishing]] — analog fishing-guide project for reference
- [[Conway Bowman]] — another fishing-guide reference
