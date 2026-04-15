# 🚀 Getting Started Guide — Your First Game, Step by Step

> **This doc is for you, Jordan.** Not for an AI agent, not for a hypothetical team. This is the honest, practical "what do I actually do next" roadmap for someone building their first game. I'll tell you what to focus on, what to skip for now, and how to create the art assets even if you've never drawn a pixel in your life.

---

## Part 1: Where You Are Right Now

Let's be real about what exists and what doesn't.

### ✅ What's Already Built (You're Further Than You Think)
Your Godot project has **working code** for:
- Player movement with WASD
- Harvesting resources by pressing E
- Saving/loading game state to JSON
- Offline time calculation (the core All-Sleep mechanic)
- Proxy deployment and pickup (the automation system)
- 3-dial Alignment Bezel mini-game
- Economy crisis events
- Bifrost realm transitions (3 realms)
- Iridescent holographic shader
- Ghost trail VFX on movement

**That's a lot.** Most first-time developers spend months getting to this point.

### 🔴 What's Missing (The Honest List)
1. **Art.** Every sprite is a placeholder rectangle. The game "works" but looks like colored boxes.
2. **TileMaps.** The realms exist as scenes but have no visual level design — no floors, walls, or environmental detail.
3. **Sound.** Zero audio. No music, no SFX.
4. **Several systems** exist as code stubs but aren't connected (stamina, chaos, three-bucket economy).

### 🎯 The Priority Call
**Art first. Systems second.** Here's why:

You can't playtest a game that looks like colored rectangles. Your brain can't "feel" the cozy management loop if it doesn't look like a world. Once the game has visual identity — even rough — you'll be 10x more motivated and can actually test if the mechanics *feel* right.

---

## Part 2: Your Sprint Plan (What To Do In What Order)

### 🏁 Sprint 1: "Make It Look Like A Game" (Week 1-2)

**Goal:** Replace all placeholder art with real (even rough) pixel art. Make the game visually readable.

| Day | Task | Time Est. |
|:----|:-----|:----------|
| 1 | Set up your pixel art tool (see Part 3) | 1 hour |
| 2 | Draw Odin's idle + walk sprites (4 directions) | 3-4 hours |
| 3 | Draw Asgard floor + wall tiles (basic tileset) | 2-3 hours |
| 4 | Build Asgard TileMap layout in Godot editor | 2 hours |
| 5 | Draw Star-Iron resource node + depleted state | 1-2 hours |
| 6 | Draw basic Proxy sprite (idle + buggy) | 2 hours |
| 7 | Draw Nidavellir tiles (dark rock, forge aesthetic) | 2-3 hours |
| 8 | Build Nidavellir TileMap in Godot | 2 hours |
| 9 | Draw Alfheim tiles (grass, trees, flowers) | 2-3 hours |
| 10 | Build Alfheim TileMap in Godot | 2 hours |
| 11 | Draw Bifrost portal sprite | 1 hour |
| 12 | Draw basic HUD elements (stamina bar, icons) | 2 hours |
| 13 | Import everything, replace all placeholders | 2-3 hours |
| 14 | **Playtest!** Walk around your world for the first time. | ∞ |

**After Sprint 1, your game should look like a game.** It won't be polished, but you'll be able to walk around three distinct realms, harvest things, and deploy proxies — and it'll actually *look* like that's what's happening.

### 🏁 Sprint 2: "Make It Feel Like A Game" (Week 3-4)

**Goal:** Connect the unwired systems. Make stamina matter. Make chaos visible.

| Task | Related Doc |
|:-----|:-----------|
| Wire StaminaBar to Odin's stamina value | `mechanics/03_kinetic_resonance.md` |
| Make Divine Sparks restore stamina on contact | `mechanics/03_kinetic_resonance.md` |
| Add Mana-Sap as second resource type | `architecture/03_save_schema.md` |
| Implement chaos tile overlays (ice for Nidavellir, vines for Alfheim) | `mechanics/08_chaos_escalation.md` |
| Connect chaos escalation to offline time | `mechanics/08_chaos_escalation.md` |
| Build the Raven Dashboard (simple text report on wake-up) | `world/01_asgard.md` |
| Add basic sound effects (harvest hit, portal whoosh, bezel click) | *new audio doc needed* |

### 🏁 Sprint 3: "Make It Complete" (Week 5-6)

**Goal:** Close the loops. Economy, diplomacy, endgame.

| Task | Related Doc |
|:-----|:-----------|
| Three-Bucket allocation UI | `mechanics/06_economy.md` |
| Basic Mediation Table UI | `mechanics/07_diplomacy.md` |
| NPC dialogue system (JSON banks) | `narrative/03_dialogue_system.md` |
| Heimdall NPC with context-aware lines | `narrative/02_character_bible.md` |
| Tutorial / first-boot flow | `narrative/04_quest_trees.md` |
| Win condition detection | `mechanics/01_core_loop.md` |

### 🏁 Sprint 4: "Polish & Ship" (Week 7-8)

**Goal:** Juice, feel, and finish.

| Task |
|:-----|
| Refine all sprite animations (smoother, more frames) |
| Add music / ambient soundscapes per realm |
| Screen transitions (fade, wipe) |
| Particle effects polish (dust, sparks, pollen) |
| Pause menu, settings, key rebinding |
| Bug testing, edge cases, save file validation |
| Export builds for PC / Mac / Linux |

---

## Part 3: How To Create Pixel Art (The Practical Guide)

### Step 1: Choose Your Tool

You have three good options. Pick ONE and stick with it.

| Tool | Cost | Best For | Get It |
|:-----|:-----|:---------|:-------|
| **Aseprite** | $20 (one-time) | The industry standard. Best tutorials, best workflow. If you're serious, buy this. | [aseprite.org](https://www.aseprite.org/) |
| **Pixelorama** | Free | Built with Godot! Full-featured, actively maintained. Best free option. | [orama-interactive.itch.io/pixelorama](https://orama-interactive.itch.io/pixelorama) |
| **Piskel** | Free | Runs in your browser. Zero setup. Great for your very first sprite. | [piskelapp.com](https://www.piskelapp.com/) |

> **My recommendation:** Start with **Piskel** today (literally right now, zero install). If you enjoy the process, buy **Aseprite** for $20 — it'll pay for itself in workflow speed within a week.

### Step 2: Learn The Fundamentals (2-3 Hours Total)

You don't need an art degree. You need to understand 4 concepts:

#### Concept 1: Silhouette First
Draw the shape of your character in a single solid color. If you can't recognize what it is from the silhouette alone, no amount of detail will fix it.

```
Bad:                Good:
 ██                  ██
████                ████
 ██                 ████
 ██                  ██
                    █  █
(Is this a person?  (That's clearly
 A tree? A rock?)    a person.)
```

#### Concept 2: Limited Palette
16-bit games use **4-8 colors per sprite**, not 256. Fewer colors = cleaner sprites = less work.

Go to **[Lospec.com/palette-list](https://lospec.com/palette-list)** and search for:
- **"Cozy"** palettes (warm, inviting)
- **"Fantasy"** palettes (rich, magical)
- **"ENDESGA 32"** — a beloved 32-color palette that covers almost any game scenario

Download the `.pal` file and import it into your editor. Now you'll always be picking from harmonious colors.

#### Concept 3: Start at 1x, Check at 1x
Work at 400-800% zoom, but **constantly check your sprite at actual 1x size** (the tiny version). If it's unreadable at 32×32 pixels, you've over-detailed it. Simplify.

#### Concept 4: Study What Works
Open your favorite 16-bit game (or Google "16-bit pixel art sprites"). Look at how they use:
- 2-3 shading steps (not gradients)
- Strong outlines (or no outlines — pick one style)
- Minimal animation frames (4 frames of walk is plenty)

### Step 3: Your First Sprite — Odin (Follow This Exactly)

1. Open your pixel editor. Set canvas to **32×32 pixels**.
2. Pick a dark blue/grey from your palette for the outline.
3. Draw Odin's **silhouette**: a robed figure, slightly hunched, one eye visible (he's Odin!).
   - Head: 5-6 pixels wide
   - Body/robes: 8-10 pixels wide, flowing down
   - Total height: ~24-26 pixels (leave margin)
4. Fill the robes with 2-3 shades of a deep blue or grey.
5. Add a gold accent for his staff (Gungnir) — 1-2 pixel wide line.
6. Add his single eye as a bright white/cyan pixel.
7. **Done.** Export as `odin_idle_down.png`.

For the walk animation:
1. Duplicate that frame 3 times (4 frames total).
2. Frame 2: Shift the robe hem 1 pixel right, move "feet" area slightly.
3. Frame 3: Same as Frame 1 (resting position).
4. Frame 4: Mirror of Frame 2 (shift left).
5. Export as a horizontal sprite sheet (128×32: four 32×32 frames side by side).

**That's it.** That's a walk cycle. It doesn't need to be perfect — it needs to exist.

### Step 4: Your First Tileset

1. Canvas: **16×16 pixels** per tile.
2. For Asgard, draw:
   - A golden/cream floor tile (just a flat color with subtle 1-pixel texture variation)
   - A darker wall/border tile
   - A decorative edge tile
3. Export each as a separate 16×16 PNG, or as a single tileset sheet.
4. In Godot: Select your level's `TileMapLayer` node → Inspector → New TileSet → drag your PNG in → Set tile size to 16×16.
5. Start painting your level!

> **Important Godot tip:** In Godot 4.3+, use `TileMapLayer` (the new node), not the old `TileMap`. Search YouTube for "Godot 4.3 TileMapLayer tutorial" if you get stuck.

---

## Part 4: The AI Art Shortcut (Use This Wisely)

If drawing pixels from scratch feels overwhelming, these AI tools can generate **game-ready pixel sprites** that you then clean up:

| Tool | What It Does | Link |
|:-----|:------------|:-----|
| **PixelLab.ai** | Generate top-down sprites with directional variants, skeletal animation | [pixellab.ai](https://www.pixellab.ai/) |
| **Sprite AI** | Generate sprites at exact pixel dimensions (32×32, etc.), exports game-ready PNGs | [sprite-ai.art](https://sprite-ai.art/) |
| **pixie.haus** | Pixel-perfect generation with palette locking, auto-animation (walk/idle/attack) | [pixie.haus](https://pixie.haus/) |

### The Smart Workflow
1. **Generate** a base sprite with AI using a prompt like *"32x32 pixel art, top-down, robed wizard character, single eye, dark blue robes, gold staff, cozy fantasy style"*
2. **Import** into Aseprite/Pixelorama
3. **Clean up** — fix any weird pixels, ensure it matches your color palette
4. **Animate** — manually add 3-4 walk frames based on the base
5. **Export** as a sprite sheet

This gets you 70% of the way there in 10 minutes instead of 3 hours. The cleanup is where YOU make it yours.

---

## Part 5: How To Actually Import Art Into Godot

Once you have PNG sprite files:

### For Character Sprites (Odin, Proxies, NPCs)
1. Drop your PNG into `project/assets/sprites/player/` (or wherever the Sprite Manifest says)
2. Open the `.tscn` scene (e.g., `Odin.tscn`)
3. Select the `Sprite2D` node
4. In the Inspector, drag your PNG into the **Texture** slot
5. If it's a sprite sheet: check **Animation → HFrames** and set it to the number of frames (e.g., 4)
6. Use an `AnimationPlayer` or `AnimatedSprite2D` to cycle frames

### For Tiles (Floor, Wall, Decorations)
1. Drop your tileset PNG into `project/assets/sprites/world/asgard/`
2. In the scene, add a `TileMapLayer` node
3. Create a **New TileSet** in the Inspector
4. Click the TileSet panel at the bottom → drag your PNG in
5. Set tile size to 16×16
6. Start painting!

### For UI Elements
1. Drop PNGs into `project/assets/sprites/ui/`
2. In HUD.tscn, select UI nodes (Buttons, ProgressBars, etc.)
3. Use **Theme Overrides** or **StyleBox** textures to skin them

---

## Part 6: Essential Learning Resources

### Pixel Art
| Resource | What You'll Learn | Link |
|:---------|:-----------------|:-----|
| **Lospec** | Color palettes, tutorials, community | [lospec.com](https://lospec.com/) |
| **Slynyrd's Tutorials** | Fundamentals of pixel art design | [slynyrd.com](https://www.slynyrd.com/blog/category/Pixel+Art) |
| **AdamCYounis (YouTube)** | "How to start pixel art" beginner series | Search "AdamCYounis pixel art" |
| **Brandon James Greer (YouTube)** | Pixel art process videos, time-lapses | Search "Brandon James Greer" |
| **Saint11 (YouTube)** | Ultra-satisfying pixel animation tutorials | Search "Saint11 pixel art tips" |

### Godot 4
| Resource | What You'll Learn | Link |
|:---------|:-----------------|:-----|
| **Brackeys Godot Beginner Series** | Complete 2D game from scratch | Search "Brackeys Godot 4" on YouTube |
| **GDQuest** | Godot-specific cheat sheets and courses | [gdquest.com](https://www.gdquest.com/) |
| **DevWorm (YouTube)** | TileMapLayer deep-dive for Godot 4.3+ | Search "DevWorm tilemap Godot" |
| **Godot Official Docs** | Always the reference | [docs.godotengine.org](https://docs.godotengine.org/en/stable/) |
| **HeartBeast (YouTube)** | RPG/action game tutorials in Godot | Search "HeartBeast Godot 4" |

### Game Design (Cozy Genre)
| Resource | Why It's Relevant |
|:---------|:-----------------|
| **Play Stardew Valley** | THE cozy management game. Study its pacing, UI, and how it teaches without tutorials. |
| **Play Moonlighter** | Management + loop structure similar to All-Sleep's cycle. |
| **Play Cult of the Lamb** | Automation + management with great "base building" UX. |
| **GDC Talk: "Designing Stardew Valley"** | Eric Barone's talk on solo dev workflow (YouTube, free to watch) |

---

## Part 7: The Mindset

### Things That Don't Matter Right Now
- ❌ Perfect pixel art (rough is fine — you'll iterate)
- ❌ Music and sound (add it last)
- ❌ Phase 2 realms (don't even think about them)
- ❌ Steam integration (way too early)
- ❌ Making it "good" (make it EXIST first)

### Things That Matter A Lot
- ✅ Can you walk around and it feels like a place?
- ✅ Can you harvest something and feel a little dopamine?
- ✅ Can you deploy a proxy, sleep, come back, and see it worked?
- ✅ Do you want to keep playing?

### The Golden Rule of First Games
> **Done is better than perfect. A bad game you finished teaches you more than a perfect game you never made.**

Your only enemy is stopping. Every session where you make progress — even ugly, hacky, embarrassing progress — is a win. The art will get better. The code will get cleaner. The design will get sharper. But only if you keep going.

---

## Active Task List

- [ ] Install pixel art tool (Piskel to start, Aseprite when ready)
- [ ] Browse Lospec.com and pick a color palette for the project
- [ ] Draw your first Odin sprite (32×32, just the idle frame)
- [ ] Import it into Godot and see it replace the placeholder
- [ ] Celebrate. Seriously. That's a huge milestone.
- [ ] Follow Sprint 1 day-by-day plan above

---

## AI Changelog

| Date | Change | Reasoning |
|:-----|:-------|:----------|
| 2026-04-15 | Created Getting Started Guide with 8-week sprint plan, pixel art tutorial, tool recommendations, AI art shortcuts, Godot import instructions, and curated learning resources. | This is a first-time developer. The biggest risk isn't bad code or bad art — it's losing momentum. This doc is designed to keep forward motion by being extremely specific about "what to do next" at every stage. |
