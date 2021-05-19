# 1. dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64 | tr -d "=+/" | tr -d '\n' | dd bs=32 count=1 2>/dev/null
# 2. bash jwt.sh $1.stdout '{"email": "admin@kubesphere.io","username": "admin","token_type": "static_token"}'
# 3. kubectl create secret generic kubesphere-secret
#    --from-literal=token=$2.stdout
#    --from-literal=secret=$1.stdout
#    -n kubesphere-system