# 1) Create (or reuse) a shared network
docker network create n8n-flaresolverr-network

# 2) Run FlareSolverr on that network
# Bind to 127.0.0.1 so it's NOT exposed publicly (FlareSolverr has no auth).
docker run -d \
  --name flaresolverr \
  --network n8n-flaresolverr-network \
  -p 127.0.0.1:8191:8191 \
  --restart unless-stopped \
  ghcr.io/flaresolverr/flaresolverr:latest

# 3) Attach your existing n8n container to the same network
docker network connect n8n-flaresolverr-network n8n_container

# 4) (optional) Restart n8n to ensure clean DNS
docker restart n8n_container
