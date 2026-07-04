# ui / design-tokens — TOKEN SYSTEM / TOKEN ՀԱՄԱԿԱՐԳ

> **EN:** One source of truth per design value, referenced everywhere. Aligned with **L13** (zero hardcode). Switching theme or density must require no code change. **HY:** Ամեն դիզայնի արժեքի համար՝ մեկ ճշմարտության աղբյուր, հղվում ամենուր։ Համահունչ **L13**-ին (զրո hardcode)։ Theme/density փոխելը չպիտի պահանջի կոդի փոփոխություն։

## The token layer / Token շերտը

The proven slice uses **shadcn semantic tokens over Tailwind v4 CSS variables** as the single source (`globals.css` `:root` / `.dark`). No component hardcodes a hex, px, or radius — every value resolves through a token.

| Token family | Source | Examples |
|---|---|---|
| **color** | `--background --foreground --card --primary --secondary --muted --accent --destructive --border --ring` (+ `-foreground` pairs) | semantic, light+dark defined |
| **radius** | `--radius` → `--radius-sm/md/lg/xl` | derived scale |
| **spacing** | Tailwind scale (`gap-*`, `p-*`, `px-*`) | 4/6/8-based rhythm |
| **typography** | `--font-sans --font-mono` + Tailwind type scale | title/body/caption |
| **shadow** | Tailwind `shadow-*` | elevation |
| **breakpoint** | Tailwind `sm/md/lg/xl` | 375/768/1024/1440 targets |

## Rules / Կանոններ (L13)

- No magic numbers, no inline hex, no baked-in font size — each is a token. / ոչ magic number, ոչ inline hex, ոչ baked-in չափ — ամեն մեկը token։
- A theme switch must leave **nothing** un-themed; contrast pairs must hold **AA** in both light and dark. / theme switch-ը ոչինչ չթողնի առանց theme-ի. contrast զույգերը AA երկուսում էլ։
- **Proven lesson (FL-002):** a token pair can still fail AA at small sizes — the soft destructive badge (`#e7000b` on `#fde6e7`) was 4.0:1 at 12px. Contrast is verified at the USED size, not assumed from the token. / Ապացուցված դաս (FL-002)՝ token զույգը կարող է AA ձախողել փոքր չափերում. contrast-ը verify արվում է ՕԳՏԱԳՈՐԾՎԱԾ չափով, ոչ ենթադրվում token-ից։

## Mode B hook / Mode B hook

When Gev's taste examples land, the token values (not the token *names*) retune toward his standard — swap-safe by design, no component change. / Երբ Gev-ի ճաշակի օրինակները գան, token-ի արժեքները (ոչ անունները) retune են դեպի իր standard-ը՝ swap-safe։
