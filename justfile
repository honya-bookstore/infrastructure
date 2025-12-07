age-encrypt-age own='~/.age-key.txt':
    age -i {{ own }} -e -o age.agekey.encrypted age.agekey

age-decrypt-age own='~/.age-key.txt':
    age -i {{ own }} -d -o age.agekey age.agekey.encrypted

add-age-cluster:
    kubectl create secret generic honyabookstore-sops-age \
    --namespace=honyabookstore \
    --from-file=age.agekey
