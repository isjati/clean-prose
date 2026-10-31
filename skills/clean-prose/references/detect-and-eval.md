<!--
Adapted from https://github.com/petergyang/no-ai-slop (skills/no-ai-slop/SKILL.md and eval.md).
Copyright (c) 2026 Peter Yang. MIT License. See THIRD_PARTY_NOTICES.md.
-->

# Detect mode and self-check

## Detect-mode output

Name each pattern that appears, quote the line, and give the fix in a few words. Do not rewrite, do not score, and do not say whether AI wrote the text. Detectors guess; named patterns are evidence the user can check.

```markdown
| # | Pattern | Line | Fix |
|---|---|---|---|
| 1 | Not X but Y (§1) | "It's not just a tool, it's a platform." | State what it does |
| 2 | Inflated significance (§13) | "marks a pivotal moment" | Give the fact: first paid product |
```

End with one sentence offering to edit.

## Extra patterns (not covered in patterns.md)

- **Portability test.** If a sentence could move unchanged to another person, company, country or product, it is filler. Cut it or replace it with a fact, mechanism, consequence or judgment specific to this subject.
- **Faux-insight setups.** "What most people get wrong", "Here's what nobody tells you", "The part everyone misses". Cut the setup and make the claim stand alone.
- **Colon reveals.** "The best part: it learns." Rewrite as a plain sentence. Keep colons for lists, labels and quotes.
- **Interpretive metadiscourse.** "That last part matters more than it sounds", "The key point is", "As you can see". Delete; let the content carry the weight.
- **Synonym cycling.** "The agent reviews... The assistant scores... The tool suggests..." If one word is right, repeat it.
- **Fake-profound kickers.** A final metaphor, aphorism or mic-drop line. Delete it; do not rewrite it into a better metaphor. End on the clearest concrete sentence.
- **Summary-recap endings.** "In conclusion", "Ultimately", "Overall", or a closing paragraph that restates the piece. End on the last concrete point or next action.
- **Weak verb phrases.** "Made a decision" becomes "decided". "Has the ability to" becomes "can".

## Self-check (pass/fail; fix any fail before returning)

Meaning and voice
1. The point is preserved with no added claims, examples, stats, quotes or opinions.
2. The writer's vocabulary, cadence, bluntness, humor, uncertainty and level of polish survive.
3. Strong human sentences were left alone, not rewritten for consistency.
4. Cutting is proportional to the slop; character was not compressed away.
5. Every generic sentence passes the portability test or was cut.

Patterns
6. No binary contrasts, negative listings, rhetorical setups, throat-clearing or faux-insight setups remain.
7. No colon reveals, shallow -ing riders, inflated verbs, synonym cycling or stacked fragments remain.
8. Puffery and unnamed authorities were replaced with plain facts or named sources, or flagged to the user.
9. No kicker line and no recap ending.
10. Formatting follows content: no emoji headings, decorative bold or bullets that should be prose.
11. Em dashes follow the house rule (none in short copy, one or two in long documents).

Final read
12. Sentence shapes and paragraph endings vary.
13. The writer would recognize the result as their own.
14. It would sound natural read aloud to a sharp colleague.
15. The output matches the selected mode (edit, file, detect, score, embedded).
