terraform-init-backend:
ifndef ACCESS_KEY
	$(error ACCESS_KEY is not set)
endif
	terraform init \
		-backend-config="access_key=${ACCESS_KEY}"
