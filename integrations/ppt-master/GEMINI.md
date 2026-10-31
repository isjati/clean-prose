<!-- clean-prose:ppt-master-hook:begin -->
# clean-prose hook for ppt-master

This workspace has the `clean-prose` skill available (plugin `isjati/clean-prose`). When you run any ppt-master route that produces or edits slide text, apply it at the points below. These steps add no user gates and never replace a ppt-master gate or check.

Do not edit anything under `skills/ppt-master/`. Its `attribution_guard.py` integrity gate must keep passing.

## Hook points

1. **While planning (Strategist, design_spec.md §IX or the Quick roster).** Write page titles, key messages and takeaways under the clean-prose drafting rules. Titles state what the page shows, not a label or slogan. Keep `design_spec.md` headings and field names in English as ppt-master requires.
2. **After the SVG pages pass the route's checks, before notes and export.** Run clean-prose in detect mode over the character content of `<text>`/`<tspan>` nodes in `svg_output/*.svg`. Fix findings in embedded mode:
   - Change text content only. Never touch attributes, ids, coordinates, fonts, element order or `data-*` metadata.
   - Keep each string at or below its original length (10% over at most) so nothing overflows its box.
   - Never change numbers, units, names, chart or table data, citations, brand slogans or template boilerplate.
   - If any SVG changed, rerun the route's final check before continuing.
3. **Speaker notes.** Before the notes split (Default Step 7.1, Quick §4), run clean-prose in embedded mode on `notes/total.md`. Keep every `# Slide <n>` heading and `---` separator. Notes are spoken: short sentences, the presenter's register.
   - Skip this step entirely when `design_spec.md §X` (or the Quick roster) records a final or literal script. Those words are verbatim by contract.
4. **Edit Native PPTX and Beautify routes.** Apply hook 2 only to text the user asked to change or to new text you write. Leave untouched text as it was.

## Report

Add one line to the route's completion report: `clean-prose: <n> slides edited, notes <edited|skipped|disabled>`.

## Opt out

If the user says "no clean-prose", "keep my wording" or "verbatim", skip all hooks for that deck.
<!-- clean-prose:ppt-master-hook:end -->
