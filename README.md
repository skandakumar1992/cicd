This project is end-to-end CI/CD pipeline with GitHub Actions + Docker + Docker Hub + Local VM (no cloud like AWS/K8s) and the following steps are given below:

Project Structure:
cicd-docker/
├── app.js
├── package.json
├── Dockerfile
├── docker-compose.yml
└── .github/
    └── workflows/
        └── ci-cd.yml
🔹 Step 1: Write a Simple Node.js App(in VS Code)
            app.js
            package.json
           Run locally in VS Code:
           npm init -y(This will auto-generate a minimal valid package.json.)
           npm install express

🔹 Step 2: Create Dockerfile
            After creating the dockerfile run the following commands.
           docker build -t cicd-docker-app .
           docker run -p 3000:3000 cicd-docker-app
🔹 Step 3: docker-compose.yml
🔹 Step 4: GitHub Actions Workflow (CI/CD)
🔹 Step 5: Configure Secrets in GitHub Repo
            Go to Repo → Settings → Secrets and variables → Actions → New repository secret:
            DOCKER_USERNAME → Your Docker Hub username
            DOCKER_PASSWORD → Your Docker Hub password or access token
🔹 Step 6: Run Pipeline
            Push your code to GitHub → Actions will trigger.
            It will run tests, build Docker image, push to Docker Hub.
👉 Check GitHub Actions logs → You should see ✅ build and push successful.
👉 Check Docker Hub → Your image will appear (e.g., docker.io/username/cicd-docker-app:latest).

🔹 Step 7: Deploy in Local VM(in ubuntu instance)
sudo apt update && sudo apt install -y docker.io docker-compose
docker pull skandakumar1992/cicd-docker-app:latest
docker run -d -p 3000:3000 skandakumar1992/cicd-docker-app:latest
docker-compose up -d

👉 Open browser: http://<VM-IP>:3000 → You’ll see "Hello from CI/CD Pipeline 🚀"
