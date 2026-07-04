# NEVER REPEAT / ԵՐԲԵՔ ՉԿՐԿՆԵԼ

> **EN:** Hard "don't do this again" list, earned from real failures. Short, absolute, append-only. **HY:** Կոշտ «էլ չկրկնել» ցուցակ՝ վաստակած իրական ձախողումներից։ Կարճ, բացարձակ, append-only։

- **NR-001:** Never assume a design token pair is AA — verify contrast at the actual rendered size (FL-002). / Երբեք մի ենթադրիր token զույգը AA է — verify արա իրական չափով։
- **NR-002:** Never claim GREEN from a run whose report didn't flush — read the evidence artifact, not the truncated console (the teardown-hang almost hid the failing detail). / Երբեք GREEN մի հայտարարիր չflush արած run-ից — կարդա artifact-ը, ոչ կտրված console-ը։
- **NR-003:** Never label an engine "universal/PROVEN" off one slice — that's the empty-abstraction trap, and it breaks L16/L18 (D-006). / Երբեք engine-ը «universal/PROVEN» մի պիտակիր մեկ slice-ից։
- **NR-004:** Never write to the spine/laws the raw way when a governed tool exists — corrupting the wall/release is worse than being slow (use `bro-release`/`bro-update-spine` + `BRO_GEV_APPROVED`). / Երբեք spine/laws-ին raw մի գրիր երբ governed tool կա։
