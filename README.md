# clean-prose

An agent skill and ruleset that removes AI writing patterns from prose while keeping the writer's facts and voice. Works across any AI coding agent or environment (Claude Code, Cursor, Antigravity, Hermes Agent, Codex) in English and Indonesian.

It has two parts:

- `rules/AGENTS.md`: ten short drafting rules that are always on. They stop the worst patterns while the agent writes, at a cost of a few hundred tokens.
- `skills/clean-prose/`: an on-demand skill for full rewrites, audits and scores. The large pattern catalogue loads only when the skill runs.

## Compatibility

- **Claude Code & Codex:** Add `skills/clean-prose/` to your skills path or include `@rules/AGENTS.md` in your project `CLAUDE.md` / `AGENTS.md`.
- **Cursor / Windsurf:** Reference `rules/AGENTS.md` in `.cursorrules` or system prompt rules.
- **Hermes Agent:** Copy `skills/clean-prose/` into `~/.hermes/skills/`.
- **Antigravity:** Install as a native plugin (see below).

## Modes

| Mode | Example prompt |
|---|---|
| Edit | "Humanize this paragraph: ..." |
| File | "Clean up the prose in docs/plan.md" |
| Detect | "Audit this README for AI tells, don't rewrite" |
| Score | "Score this post with clean-prose" |
| Embedded | Called by another workflow (commit messages, PR text, presentation generators, reports) |

## Install

Windows (Antigravity):

```powershell
git clone https://github.com/isjati/clean-prose.git "$env:USERPROFILE\.gemini\config\plugins\clean-prose"
```

Linux, macOS or WSL:

```bash
git clone https://github.com/isjati/clean-prose.git ~/.gemini/config/plugins/clean-prose
```

Update later with `git pull` in that folder, or run `scripts/install-windows.ps1` / `scripts/install.sh`. Start a new conversation after installing. Turn the plugin off from the plugin settings if you want it disabled.

Other agents that read `SKILL.md` (Claude Code, Codex, Hermes): copy `skills/clean-prose/` into that agent's skills folder.

## How the sources were combined

| Source | Used for |
|---|---|
| [blader/humanizer](https://github.com/blader/humanizer) v3.1.0 | The ranked pattern catalogue, vendored verbatim in `references/patterns.md` |
| [petergyang/no-ai-slop](https://github.com/petergyang/no-ai-slop) | Detect mode, the portability test, extra patterns and the pass/fail self-check |
| [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | The /50 scoring rubric, false agency and jargon tables |

Where the sources disagree, `SKILL.md` sets one rule. Em dashes are banned in short copy and limited to one or two in long documents. Passive voice, adverbs, Wh- openers and lists of three are judged case by case instead of banned. The Indonesian patterns in `references/id-patterns.md` are new.

Run `scripts/check-upstream.sh` to see whether humanizer has changed since it was vendored. Add `--apply` to refresh it.

## License

MIT. Third-party notices for the three upstream projects are in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
