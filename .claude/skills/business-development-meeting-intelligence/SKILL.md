---
name: business-development-meeting-intelligence
description: Turns business development / sales meeting notes plus supplied market research into a structured, actionable follow-up memo with a meeting summary, connected market insight, recommended follow-up, an action-items table, and a risks/missing-information section. Use this skill whenever the user shares BD, sales, partnership, or client meeting notes and asks for a follow-up memo, next steps, a recap to send internally, or help figuring out what to do after a meeting — especially if they also hand over market research, competitor news, pricing updates, or industry trends to weave in. Also trigger if the user asks to "make this consistent every time" for meeting follow-ups, since that consistency is exactly what this skill packages. Do not invent owners, deadlines, agreements, or market facts that aren't in the supplied materials — this skill exists specifically to stop that from happening.
---

# Business Development Meeting Intelligence

## Purpose

Turn a set of BD/sales meeting notes — together with whatever market research
is supplied alongside them — into one follow-up memo. The memo has to be
something a salesperson or account owner can act on directly, and it has to
be trustworthy: every claim in it should be traceable back to either the
meeting notes or the supplied research, never to inference or plausible
guesswork.

The two things that make this hard to do consistently by hand are exactly
the two judgment calls below. Apply them the same way on every run.

## Inputs

Expect two kinds of source material, either pasted inline or as attached
files:

1. **Meeting notes** — from a BD, sales, partnership, or client meeting.
   These may be polished or rough (bullet fragments, a transcript, a
   half-finished doc).
2. **Market research** — competitor news, pricing changes, industry trends,
   product/tech developments, analyst commentary, etc. This may be a lot of
   material, only some of which is relevant to this particular meeting.

If only meeting notes are supplied and no market research, still produce the
memo — just say plainly in Section 2 that no market research was supplied
(see Judgment Call #2).

## Judgment Call #1: What counts as a complete follow-up

A follow-up is only useful if someone can act on it without having to go
back and ask "wait, who's doing this, and by when?" So for every meeting,
check the notes for three things:

- **Next steps** — what is actually going to happen next
- **Owner** — who is responsible for each action
- **Timeline** — when it's expected to happen

The rule: only report what the notes actually support. If the notes say
"send over pricing" but never say who or by when, that's a next step with
two missing fields — don't fill them in with a plausible-sounding guess
(e.g. don't assume the account owner is the default owner, and don't assume
"next week" because that's typical). Mark exactly what's missing as
`Requires Human Review`, per field, not for the whole item. Half-known
action items (e.g. clear owner, no timeline) should still show what is
known — don't discard the whole item just because one field is missing.

If the meeting was exploratory or vague enough that you can't identify any
concrete next steps at all, say so directly in the memo rather than
manufacturing steps to fill out the section. A short, honest memo beats a
padded, confident-sounding one.

## Judgment Call #2: What market research actually belongs in the memo

Default to leaving research out. The bar for inclusion is not "is this true
and related to the industry" — it's "does this change what we do after
*this* meeting." Before including any research finding, answer:

> **How does this information change what we should do after this meeting?**

If you can't answer that in a sentence tied to something specific that was
actually said or decided in the notes, cut the finding. Concretely, a
finding earns a place in the memo only if it connects to one of:

- A competitor the prospect/customer named or compared you to
- A concern or objection raised in the meeting that current market trends
  either confirm or complicate
- A pricing change that affects the deal or terms being discussed
- A technology/product development relevant to a specific objection or
  requirement raised
- An industry shift that would plausibly change the recommended next step

"This is interesting background on the industry" is not a qualifying
reason. Neither is "this is about a competitor" in the abstract — it has to
be a competitor or dynamic that actually came up, or that bears directly on
something the customer said.

If nothing in the supplied research clears this bar, don't force a
connection. State plainly in Section 2 that no relevant market signal was
identified for this meeting, and explain briefly what was reviewed and
ruled out. That statement is a legitimate, complete output — not a
failure to find something.

## Producing the memo

Use exactly these five sections, in this order. If a section has nothing
substantive to report (e.g. no relevant research, no risks), keep the
section header and say so explicitly rather than omitting it — an absent
section reads as "forgotten," an explicit "none identified" reads as
"checked."

### 1. Meeting Summary
- Purpose of meeting
- Key discussion points
- Decisions made
- Open questions

Stick to what's in the notes. If the purpose isn't stated, say it isn't
stated rather than inferring one from context.

### 2. Relevant Market Insight
- Brief summary of the external market information (only what passed the
  Judgment Call #2 bar above)
- Why it matters to *this* meeting specifically — the one-sentence answer
  to "how does this change what we do next"
- Confidence level, when it's meaningful to flag (e.g. a rumor vs. a
  confirmed pricing announcement, recent vs. dated information)

If nothing qualified, this section is one honest paragraph: no relevant
market signal was identified, plus what was reviewed.

### 3. Recommended Follow-up

Explain how the market insight (if any) changes, strengthens, or
reprioritizes the recommended next action. If Section 2 came up empty, base
the recommendation on the meeting notes alone and say explicitly that it
isn't informed by external research — don't retrofit a research
justification that isn't there.

### 4. Action Items

A table, always with these three columns:

| Owner | Action | Timeline |
|---|---|---|

One row per next step. Fill any unknown cell with `Requires Human Review`
— never with a plausible guess. It's fine, and expected, for a table to
have several `Requires Human Review` cells if the notes were thin on
ownership or timing.

### 5. Risks or Missing Information

Call out, as a list:
- Missing commitments (things implied but never actually confirmed)
- Unclear ownership
- Unsupported assumptions (anywhere you were tempted to guess and didn't)
- Research limitations (stale data, single-source claims, low-confidence
  signals used in Section 2)
- Anything else that should get a human's eyes before someone acts on this
  memo

If genuinely nothing applies, say "No significant risks or gaps
identified" rather than dropping the section.

## Hard rules

Never invent, under any framing:

- Deadlines
- Owners
- Agreements or commitments
- Market facts
- Customer intentions
- Business decisions

If the meeting notes are vague, exploratory, or incomplete, say so and let
the memo be correspondingly limited — don't compensate by writing a more
confident memo than the source material supports. If the supplied research
doesn't meaningfully connect to the meeting, say that plainly instead of
stretching a connection to justify including it. Every sentence in the memo
should be traceable to the meeting notes or the supplied research; if you
can't point to where something came from, it doesn't belong in the memo.

Favor a short, accurate memo over a long, impressive-sounding one — that
tradeoff is the whole point of this skill.
