// ── Page & Typography ──────────────────────────────────────────────────────
#set page(margin: (x: 0.75in, y: 0.6in), paper: "us-letter")
#set text(font: "IBM Plex Sans", size: 9pt, fill: luma(25))
#set par(leading: 0.6em)

// ── Theme ──────────────────────────────────────────────────────────────────
#let accent   = rgb("#1D4ED8")
#let code_clr = rgb("#16A34A")

// ── Secrets ────────────────────────────────────────────────────────────────
#let email = sys.inputs.at("email", default: "")
#let phone = sys.inputs.at("phone", default: "")

// ── Inline code styling ────────────────────────────────────────────────────
#show raw.where(block: false): it => text(fill: code_clr, font: "JetBrains Mono NL")[#it]

// ── Helpers ────────────────────────────────────────────────────────────────
#let section(title) = {
  v(0.6em)
  text(size: 10pt, weight: "bold", fill: accent)[#upper(title)]
  v(0.15em)
  line(length: 100%, stroke: 0.5pt + accent)
  v(0.3em)
}

#let company(name, location) = grid(
  columns: (1fr, auto),
  [*#name* · #text(fill: luma(60))[#location]]
)

#let role(title, dates, bullets) = pad(left: 1em)[
  #v(0.15em)
  #grid(
    columns: (1fr, auto),
    [_#title _],
    text(fill: luma(60), size: 9.5pt)[#dates],
  )
  #list(..bullets)
]

#let edu(degree, school, gpa, dates, note: none) = {
  grid(
    columns: (1fr, auto),
    [*#degree* · #text(fill: luma(60))[#school] · #text(fill: luma(60))[#gpa GPA]],
    text(fill: luma(60))[#dates],
  )
  if note != none {
    v(0.1em)
    h(2em)
    text(size: 9.5pt, fill: luma(50), style: "italic")[#note]
  }
  v(0.4em)
}

#let doi-link(doi) = link(
  "https://doi.org/" + doi,
  text(fill: accent, size: 9pt)[doi:#doi]
)

// ══ HEADER ════════════════════════════════════════════════════════════════
#align(center)[
  #text(size: 22pt, weight: "bold")[Elliot Farmer Garcia]\
  #v(0.5em)
  #text(size: 9.5pt, fill: luma(50))[
    #link("mailto:" + email)[#email] · #phone
  ]
]

// ══ SUMMARY ═══════════════════════════════════════════════════════════════
#section("Summary")
Staff AI/ML engineer and active IEEE researcher with a production track record spanning
core library architecture to published AutoML methods — four publications and
two patents filed across 2025-2026.

// ══ EXPERIENCE ════════════════════════════════════════════════════════════
#section("Experience")

#v(0.35em)
#company("AIceberg", "New York, NY")
#role(
  "Staff AI Engineer",
  "Apr 2026 - Present",
  (
    [Architected `mint-foundry`, a scalable automated pipeline that turns new threat samples into updated models on demand],
  )
)

#v(0.35em)
#company("Verseon", "Fremont, CA")
#role(
  "Senior ML Engineer",
  "Apr 2025 - Apr 2026",
  (
    [Took sole ownership of `nano-elm`, a high-performance C++ model training library with bare-metal CUDA/HIP/SYCL backends, raw cuBLAS dispatch, and SIMD-accelerated activations via Intel IPP],
    [Key driver in the conception and implementation of breakthrough imputation
      and ensembling techniques achieving state-of-the-art predictive performance in biomedical risk modeling],
  )
)
#role(
  "ML Engineer",
  "Nov 2022 - Apr 2025",
  (
    [Architected `vml`, Verseon's core Python ML library, and `vml-taskforge`, its distributed task queue],
  )
)

#v(0.35em)
#company("Edammo", "Iowa City, IA")
#role(
  "Software Engineer",
  "Jan 2021 - Nov 2022",
  (
    [Spearheaded a ground-up overhaul of the core data worker and API codebases in Python],
    [Led client engagements as primary technical liaison],
    [Built a React dashboard for demoing ML models to clients]
  )
)

// ══ EDUCATION ═════════════════════════════════════════════════════════════
#section("Education")

#edu(
  "M.S. Artificial Intelligence",
  "University of Texas at Austin",
  "3.92",
  "Class of '26",
)
#edu(
  "B.S. Computer Information Systems",
  "University of Houston",
  "3.99",
  "Class of '23",
  note: [Minor in Data Science],
)

// ══ PUBLICATIONS ══════════════════════════════════════════════════════════
#block(breakable: false)[
  #section("Publications")

  - "Validation-Conditioned Dynamic Ensemble Regression with Applications in
    Biomedical Data." _2026 IEEE International Conference on AI and Data Analytics_, Boston, MA.

  - "AutoML Framework for Ensembling: Split Validation Sets for Coefficient and
    Structure Selection." _2025 IEEE Conference on Artificial Intelligence_, Santa Clara, CA, pp. 1-7.
    #doi-link("10.1109/CAI64502.2025.00189")

  - "A Novel Modeling Focused Missing Data Imputation Framework."
    _2025 IEEE Conference on Artificial Intelligence_, Santa Clara, CA, pp. 1355-1360.
    #doi-link("10.1109/CAI64502.2025.00234")

  - "Extreme AutoML - Analysis of Classification, Regression, and NLP Performance."
    _International Journal of Innovative Science Engineering and Technology_, Vol. 12 Issue 01, Jan 2025, pp. 39-50.
    #doi-link("10.48550/arXiv.2412.07000")
]
// ══ PATENTS ═══════════════════════════════════════════════════════════════
#block(breakable: false)[
  #section("Patents Filed")

  - VerseAge: A Phenotypic Age Predictor Based on a Shallow Random Network Architecture
  - Modeling-Focused Missing Data Imputation Approach
]

// ══ SKILLS ════════════════════════════════════════════════════════════════
#block(breakable: false)[
  #section("Skills")
  #grid(
    columns: (auto, 1fr),
    gutter: (0.5em, 0.35em),
    [*Languages*],  [Python · Rust · C++ · JavaScript / TypeScript · HTML / CSS],
    [*ML & Data*],  [PyTorch · Hugging Face · NumPy / JAX · Pandas / Polars · SciPy / Scikit-Learn],
    [*Frameworks*], [FastAPI · Celery · Node.js · React],
    [*Databases*],  [PostgreSQL · MongoDB],
    [*Cloud*],      [AWS EC2 · S3 · SQS · RDS · DocumentDB · _Solutions Architect Associate_],
    [*Tools*],      [Docker · Git · Vite · CMake · uv · _Tableau Desktop Specialist_],
  )
]


// ══ AWARDS ════════════════════════════════════════════════════════════════
#section("Awards")

- Certificate of Excellence in Data Science, HPE Data Science Institute
- Honorable Mention, Cloudathon\@UH 2023