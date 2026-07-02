# AI in Test Automation

This repository is for testing the use of AI in test automation.

It is a Robot Framework + SeleniumLibrary (Selenium) project used as a sandbox for experimenting with AI-assisted approaches to writing, running, and maintaining automated tests.

## Project structure

```
tests/
  DemoScenarios.robot      # Demo suite: one passing and one deliberately failing test
  GoogleSearchTest.robot   # Google search test (runs locally only, excluded in CI)
resources/
  Common.robot             # Browser setup/teardown keywords
  pages/                   # Page objects (POM)
.github/workflows/
  robot-tests.yml          # CI workflow that runs the tests and uploads reports
```

## Demo scenarios

`tests/DemoScenarios.robot` exists to showcase reporting in the CI workflow:

- **Happy Scenario** — opens https://example.com and verifies its heading and text. Always passes.
- **Failed Scenario** — asserts text that does not exist on the page. Always fails, on purpose.

## Running locally

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
robot --outputdir results tests
```

Add `--variable HEADLESS:True` to run without a visible browser window.

## CI reports

Every push to `main` triggers the **Robot Framework Tests** workflow, which:

1. Runs the tests headless on Ubuntu (excluding tests tagged `local-only`).
2. Prints a pass/fail summary on the workflow run page.
3. Publishes the reports to GitHub Pages: **https://mmdmirh.github.io/ai-test-automation/** — a summary page with links to the full `report.html` and `log.html` from the latest run.
4. Also uploads `report.html`, `log.html`, and `output.xml` as the **robot-framework-reports** artifact on the run page.
