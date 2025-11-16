# springboot-ci-cd-sample

**What this repo shows:**  
A minimal Spring Boot app + complete GitHub Actions CI pipeline that builds, runs tests, containerizes and publishes a Docker image to **GitHub Container Registry (GHCR)**.

---

## Features
- Build & test with Maven (Java 17)
- Containerize using Docker multi-stage build
- Push images to GitHub Container Registry (GHCR)
- Simple placeholder for image scanning
- Demo-ready for clients and interviews

---

## Quick local run
1. Build:
   ```bash
   mvn -f ./app/pom.xml clean package
