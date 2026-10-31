# clean-prose

An Antigravity plugin that removes AI writing patterns from prose while keeping the writer's facts and voice. It works in English and Indonesian.

It has two parts:

- `rules/AGENTS.md`: ten short drafting rules that are always on. They stop the worst patterns while the agent writes, at a cost of a few hundred tokens.
- `skills/clean-prose/`: an on-demand skill for full rewrites, audits and scores. The large pattern catalogue loads only when the skill runs.

## Modes

| Mode | Example prompt |
|---|---|
| Edit | "Humanize this paragraph: ..." |
| File | "Clean up the prose in docs/plan.md" |
| Detect | "Audit this README for AI tells, don't rewrite" |
| Score | "Score this post with clean-prose" |
| Embedded | Called by another workflow (ppt-master, commit messages, PR text) |

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

## ppt-master integration

`integrations/ppt-master/` hooks the skill into [hugohe3/ppt-master](https://github.com/hugohe3/ppt-master): slide titles follow the drafting rules during planning, SVG text gets a detect-and-fix pass before export (length-capped so nothing overflows), and speaker notes get an embedded pass unless they are a verbatim script.

```bash
integrations/ppt-master/install.sh ~/projects/ppt-master
```

The script writes a marked block into `ppt-master/GEMINI.md` and adds that file to `.git/info/exclude`, so upstream pulls stay clean. It does not touch `skills/ppt-master/`, which has its own integrity check.

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
