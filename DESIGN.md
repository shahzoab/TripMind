---
name: tripMind Design System
colors:
  surface: '#fcf8fb'
  surface-dim: '#dcd9dc'
  surface-bright: '#fcf8fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f5'
  surface-container: '#f0edef'
  surface-container-high: '#eae7ea'
  surface-container-highest: '#e4e2e4'
  on-surface: '#1b1b1d'
  on-surface-variant: '#414755'
  inverse-surface: '#303032'
  inverse-on-surface: '#f3f0f2'
  outline: '#717786'
  outline-variant: '#c1c6d7'
  surface-tint: '#005bc1'
  primary: '#0058bc'
  on-primary: '#ffffff'
  primary-container: '#0070eb'
  on-primary-container: '#fefcff'
  inverse-primary: '#adc6ff'
  secondary: '#5e39e0'
  on-secondary: '#ffffff'
  secondary-container: '#7757fa'
  on-secondary-container: '#fffbff'
  tertiary: '#006b27'
  on-tertiary: '#ffffff'
  tertiary-container: '#008733'
  on-tertiary-container: '#f7fff2'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#adc6ff'
  on-primary-fixed: '#001a41'
  on-primary-fixed-variant: '#004493'
  secondary-fixed: '#e6deff'
  secondary-fixed-dim: '#cabeff'
  on-secondary-fixed: '#1c0062'
  on-secondary-fixed-variant: '#4816cb'
  tertiary-fixed: '#72fe88'
  tertiary-fixed-dim: '#53e16f'
  on-tertiary-fixed: '#002107'
  on-tertiary-fixed-variant: '#00531c'
  background: '#fcf8fb'
  on-background: '#1b1b1d'
  surface-variant: '#e4e2e4'
typography:
  display-transit:
    fontFamily: Inter
    fontSize: 36px
    fontWeight: '800'
    lineHeight: 40px
    letterSpacing: -0.03em
  headline-lg:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.015em
  headline-sm:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  title-card:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 22px
    letterSpacing: -0.005em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  label-code:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 24px
    letterSpacing: 0.04em
  label-pill:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-meta:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
    letterSpacing: 0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-sm: 0.75rem
  margin: 1.25rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.25rem
  space-xl: 1.5rem
---

## Brand & Style

This design system is tailored for an effortless, stress-reducing, premium AI travel companion engineered primarily for modern mobile experiences. The aesthetic balances Apple Human Interface precision with tactile Material 3 surface physics. It blends calm, utilitarian structure with understated luminous AI moments.

### Core Visual Principles
- **Effortless Clarity:** Travel is inherently chaotic. The interface provides absolute clarity through crisp typographic contrast, dedicated visual tiers, and ample negative space.
- **Ambient Intelligence:** AI capabilities are never gimmicky; they are rendered through refined electric gradients, luminous strokes, and subtle sparkle micro-motifs that communicate proactive synthesis.
- **Tactile Softness:** Surfaces feel physical, light, and elevated with large-radius enclosures, diffused natural drop shadows, and clean hairline boundaries.
- **Transcontinental Utility:** Information density scales dynamically—scannable for rushed glances at airport gates, expansive during relaxed evening planning.

## Colors

The palette establishes high semantic rigor: dependable oceanic blue for core interactions, energetic purple-indigo for generative AI capabilities, and strict system states for instant readability during transit.

### Palette Implementation Rules
- **Primary Action (`#007AFF`):** Reserved for forward navigation, confirmed actions, active tab indicators, and progress tracks.
- **AI Intelligence Spectrum (`linear-gradient(135deg, #7C5CFF, #007AFF)`):** Applied to generative suggestions, itinerary auto-fill triggers, intelligent rescheduling banners, and glowing border treatments.
- **Surface & Canvas:**
  - *Light Mode:* Background uses `#F5F5F7` to prevent pure-white glare. Cards and modals sit atop with `#FFFFFF`.
  - *Dark Mode:* Background transitions to obsidian `#0D0E12`, primary card surfaces to `#1A1C23`, and dividers/borders to `#2E313D`.
- **Typography & Neutrals:** Primary `#1C1C1E` ensures optimal readability. Secondary `#6E6E73` provides context without distraction. Tertiary `#A1A1A6` handles minor timestamps and auxiliary metadata.
- **Semantic Status Signals:**
  - *Confirmed / On-Time:* Emerald Green (`#34C759`)
  - *Caution / Delayed / Pending:* Amber Orange (`#FF9500`)
  - *Disrupted / Cancelled:* Carmine Red (`#FF3B30`)
  - *In-Transit / Scheduled:* Action Blue (`#007AFF`)

## Typography

The typographic engine uses Inter to ensure high legibility on mobile screens under varying lighting conditions.

### Architectural Rules
- **Transit Display (`display-transit`):** Reserved exclusively for major route markers and airport/rail terminal codes (e.g., `JFK`, `HND`, `LHR`). Tight negative tracking creates an architectural, confident anchor point on transport overview panels.
- **Code Labels (`label-code`):** Used in ticket manifests, flight cards, and boarding passes. Features open positive tracking for error-free scanning.
- **Itinerary Hierarchy:** Timeline moments prioritize departure/arrival times in `headline-sm` with semantic weight, while event locations and notes remain comfortably grounded in `body-md` and `body-sm`.
- **Text Truncation:** Card titles allow up to two lines before truncating. Transit codes, gate identifiers, and countdowns must never truncate under any viewport constraints.

## Layout & Spacing

This design system uses a strict mobile-first architecture targeted at a base 390x844 viewport, scaling responsively across compact mobile screens, large phones, and folded states.

### Layout Rhythm & Breakpoints
- **Compact Viewport (360px – 428px):** 4-column layout, `margin-mobile: 16px` (1rem), column gutters `12px` to `16px`. Safe-area padding respects hardware notches and the iOS dynamic island.
- **Expanded Tablet Viewport (429px – 834px):** 8-column layout, margins expand to `24px`, enabling split-screen views (interactive map on the left, chronological stream on the right).
- **Vertical Rhythm:** 4px baseline sub-grid. Stack intervals consistently use 8px (`space-sm`), 16px (`space-md`), and 24px (`space-xl`) to preserve clear spatial relationships.
- **Touch Targets:** Interactive targets (buttons, timeline chips, date pickers) maintain a minimum hit area of 44x44 points.

## Elevation & Depth

Visual depth avoids harsh drops and heavy outlines. Instead, it relies on soft light scattering and physical elevation tiers to mimic stacked frosted travel documents.

### Surface Tiers
- **Tier 0 (Base Canvas):** Light Mode `#F5F5F7` / Dark Mode `#0D0E12`. Flat, ground-level surface.
- **Tier 1 (Resting Cards & Timeline Modules):** Pure `#FFFFFF` (or `#1A1C23` in dark mode). Casts a diffused ambient shadow: `box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05), 0 1px 3px rgba(0, 0, 0, 0.02)`.
- **Tier 2 (Floating Action Triggers & Sheets):** Elevated interactive elements. Casts `box-shadow: 0 12px 32px rgba(0, 0, 0, 0.08), 0 2px 6px rgba(0, 0, 0, 0.04)`.
- **Tier 3 (AI Focus & Overlays):** Interactive AI recommendation states receive a soft chromatic aura: `box-shadow: 0 8px 24px rgba(124, 92, 255, 0.18)`.
- **Hairline Borders:** In both color modes, elevated cards carry a subtle 1px border (`rgba(0, 0, 0, 0.04)` in light mode, `#2E313D` in dark mode) to maintain crisp edges regardless of display contrast.

## Shapes

The shape system balances approachable, friendly travel interfaces with the geometric precision of aviation design.

### Enclosure Scale
- **Cards & Primary Modules:** 16px to 20px border radius (`rounded-lg` to `rounded-xl`).
- **Pills, Tags & Badges:** Fully rounded (`rounded-full`, 9999px) to communicate tappability and high-priority state labels.
- **Input Fields & Search Surfaces:** 14px to 16px radius.
- **Bottom Sheets & Modals:** Top edges use 24px corner radii with a centered 36x4px pill grab-handle.

## Components

### 1. Trip Overview Card
- **Structure:** 16:9 or 2:1 photographic header with an internal bottom vignette gradient, wrapped in a 20px rounded card.
- **Badges:** Floating top-left countdown pill (`T-minus 3 days`) rendered with a semi-transparent blur backdrop (`backdrop-filter: blur(12px)`, background `rgba(28,28,30,0.6)`), white text. Top-right semantic trip status pill (`Confirmed`, green tint).
- **Body:** Trip destination title in `headline-md`, departure date range in `body-sm`, and avatars of co-travelers grouped on the bottom right.

### 2. Vertical Itinerary Timeline
- **Connector Spine:** 2px solid vertical line (`#E5E5EA` in light mode, `#2E313D` in dark mode) offset 28px from the left edge.
- **Node Badges:** 32x32px circular icon badges aligned to the spine. Flight (airplane), Hotel (bed), Activity (compass), Dining (cutlery).
- **Time Block:** Monospace-aligned `label-meta` positioned adjacent to the icon.
- **Event Card:** Elevated Tier 1 card containing activity name, reservation code, and quick-action icon buttons (Directions, Call, Voucher).

### 3. Flight Tracking Card
- **Header:** Airline carrier name, flight number, and live status indicator (`On Time` in `#34C759` or `Delayed 25m` in `#FF9500`).
- **Route Visualizer:** Departure airport code (`label-code`, e.g. `SFO`) on the left, destination (`label-code`, e.g. `NRT`) on the right. A continuous curved SVG flight trajectory path with an active airplane marker positioned by live progress percentage.
- **Data Footer:** 3-column split for Terminal, Gate, and Seat with subtle vertical dividers (`rgba(0,0,0,0.06)`).

### 4. AI Suggestion Chip & Banner
- **Pill Variant:** Height 36px, fully pill-shaped. Background is pure white with a 1.5px gradient stroke transitioning from `#7C5CFF` to `#007AFF`. Accompanied by a 14px 4-point sparkle SVG icon at the leading edge.
- **Generative Assistant Banner:** Surface tinted with a 5% opacity dual gradient fill (`#7C5CFF` / `#007AFF`). Border is 1px solid `rgba(124, 92, 255, 0.2)`. Body features natural language summary text and a single primary confirmation button.

### 5. Floating Navigation & Action Triggers
- **Bottom Navigation Bar:** Floating tab dock positioned 16px above the home indicator. Background is translucent white (`rgba(255,255,255,0.85)` / dark `rgba(26,28,35,0.85)`) with an ultra-thin border stroke and 20px blur. Active tab icons use `#007AFF` with a micro 4px indicator dot beneath.
- **Floating Action Button (FAB):** 56x56px circular button elevated to Tier 2, styled with the AI gradient (`#7C5CFF` to `#007AFF`) and a pure white sparkle/plus glyph for context-aware itinerary additions.

### 6. Form Inputs & Interactive Selectors
- **Input Fields:** 52px height, 14px border radius, `#FFFFFF` fill with an inset border `#E5E5EA`. On focus, the border shifts to `#007AFF` with a subtle 3px focus ring (`rgba(0, 122, 255, 0.15)`).
- **Checkboxes & Radios:** 20px size, 6px radius for checkboxes, circular for radios. Selected state uses `#007AFF` fill with a crisp white mark.