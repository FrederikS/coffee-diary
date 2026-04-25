# coffee-diary — DESIGN.md

This document defines the visual design system for the coffee-diary UI. It is the
single source of truth for all design decisions. Agents implementing UI features must
follow these guidelines consistently — do not introduce colors, fonts, spacing, or
component styles that are not defined here.

---

## Mood & intent

Warm, minimal, and personal. The UI should feel like a well-designed tasting journal —
clean and uncluttered, but with enough warmth to feel inviting rather than sterile.
Think cream paper, good typography, quiet details.

---

## Color palette

All colors are defined as CSS custom properties in `tailwind.config.ts`. Always
reference tokens by name — never use raw hex values in components.

| Token                  | Hex       | Usage                                      |
|------------------------|-----------|--------------------------------------------|
| `--color-cream`        | `#FAF7F2` | Page background                            |
| `--color-espresso`     | `#2C1A0E` | Primary text, headings                     |
| `--color-amber`        | `#BA7517` | Accent — ratings, active states, highlights|
| `--color-latte`        | `#8B6F5E` | Secondary text, metadata, labels           |
| `--color-oat`          | `#E8E0D5` | Borders, dividers, empty rating dots       |
| `--color-slate`        | `#5F5E5A` | Tertiary text, hints                       |
| `--color-surface`      | `#FFFFFF` | Card backgrounds                           |

### Semantic badge colors

Used for origin and type badges only — not for general UI.

| Usage         | Background  | Text      |
|---------------|-------------|-----------|
| Origin badge  | `#FAEEDA`   | `#633806` |
| Type badge    | `#E1F5EE`   | `#085041` |

---

## Typography

Font family: **Inter** with system sans-serif fallback.

```css
font-family: 'Inter', system-ui, -apple-system, sans-serif;
```

Two weights only — never use 600, 700, or higher.

| Weight | Value | Usage                        |
|--------|-------|------------------------------|
| Regular | 400  | Body text, metadata, labels  |
| Medium  | 500  | Headings, card titles, nav   |

### Type scale

| Role         | Size  | Weight | Color              |
|--------------|-------|--------|--------------------|
| Page heading | 22px  | 500    | `--color-espresso` |
| Section heading | 18px | 500  | `--color-espresso` |
| Card title   | 15px  | 500    | `--color-espresso` |
| Body         | 16px  | 400    | `--color-espresso` |
| Secondary    | 14px  | 400    | `--color-latte`    |
| Label / eyebrow | 11px | 400 | `--color-latte`, uppercase, `letter-spacing: 0.07em` |
| Hint         | 12px  | 400    | `--color-slate`    |

---

## Spacing & layout

- Page background: `--color-cream`
- Max content width: `1100px`, centered
- Page padding: `2rem` horizontal on desktop, `1rem` on mobile
- Section spacing: `2rem` between major sections
- Card grid gap: `12px`
- Component internal padding: `1rem 1.25rem`

---

## Components

### Navigation

- Background: `--color-surface` (white)
- Bottom border: `0.5px solid --color-oat`
- Brand name: 15px / 500 / `--color-espresso`
- Nav links: 13px / 400 / `--color-latte`
- Active nav link: 13px / 500 / `--color-espresso`

### Cards

Cards are the primary content container for roasteries and coffees.

- Background: `--color-surface`
- Border: `0.5px solid --color-oat`
- Border radius: `12px`
- Padding: `1rem 1.25rem`
- No shadows

```html
<div class="bg-surface border border-oat rounded-xl p-5">
  ...
</div>
```

Card anatomy (top to bottom):
1. **Eyebrow** — 11px uppercase label (e.g. "Roastery", "Coffee")
2. **Title** — 15px / 500 card name
3. **Subtitle** — 13px secondary info (e.g. roastery name, drink type)
4. **Badges** — origin and/or type badges
5. **Rating dots** or **count hint** at the bottom

### Badges

Pill-shaped, small, used for origin countries and coffee types.

- Border radius: `99px`
- Font size: `11px`
- Padding: `2px 8px`
- No border — background color provides the container

Use semantic badge colors defined in the palette section above.

```html
<span class="badge-origin">Ethiopia</span>
<span class="badge-type">100% Arabica</span>
```

### Rating dots

Used to display ratings (0–10) as a row of filled and empty dots.

- Dot size: `8px × 8px`, `border-radius: 50%`
- Filled dot: `--color-amber`
- Empty dot: `--color-oat`
- Gap between dots: `3px`
- Rating label: `12px / --color-latte` appended after dots (e.g. `7 / 10`)
- Row alignment: `flex`, `align-items: center`

### Eyebrow labels

Small uppercase labels used above card titles and section headers.

- Font size: `11px`
- Color: `--color-latte`
- Text transform: `uppercase`
- Letter spacing: `0.07em`
- Margin bottom: `4px`

---

## Tailwind configuration

Extend Tailwind's default theme in `tailwind.config.ts` to register all design tokens:

```ts
export default {
  theme: {
    extend: {
      colors: {
        cream: '#FAF7F2',
        espresso: '#2C1A0E',
        amber: '#BA7517',
        latte: '#8B6F5E',
        oat: '#E8E0D5',
        slate: '#5F5E5A',
        surface: '#FFFFFF',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
      fontSize: {
        'eyebrow': ['11px', { letterSpacing: '0.07em' }],
      },
      borderRadius: {
        'card': '12px',
        'badge': '99px',
      },
    },
  },
}
```

---

## Do's and don'ts

**Do:**
- Use only colors defined in the palette
- Use only weights 400 and 500
- Use cream as the page background, white for card surfaces
- Use amber exclusively as the accent color
- Keep borders at 0.5px
- Use eyebrow labels to orient the user within a card

**Don't:**
- Introduce new colors not in the palette
- Use font weight 600 or 700
- Use shadows on cards
- Use colored backgrounds on cards (cards are always white)
- Use amber for anything other than ratings and active/highlight states
- Use rounded corners on single-sided borders

---

## Component library

UI is built with **shadcn-vue** as the component foundation. shadcn-vue components
are configured to inherit the design tokens above via Tailwind. When adding a new
shadcn-vue component, always verify it respects the palette and typography defined
here — override styles where needed rather than accepting shadcn defaults.