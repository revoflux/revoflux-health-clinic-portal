---
name: Windows HMS launcher
description: Durable constraints for the standalone Windows batch launcher.
---

The Windows launcher must run from its own directory, keep commands on separate lines, pause on every failure, and wait for both service ports to respond before opening the browser.

**Why:** Windows batch parsing is fragile when generated commands are flattened, and fixed sleep durations cause false connection-refused errors on slower machines.

**How to apply:** Preserve `cd /d "%~dp0"`, explicit error pauses, and port readiness checks when changing the launcher.