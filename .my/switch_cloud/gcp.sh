#!/bin/bash

PROFILE_NAME=$MY_GCP_PROFILE_NAME
ACCOUNT_NAME=$MY_GCP_ACCOUNT_NAME
PROJECT_ID=$MY_GCP_PROJECT_ID
RIGION=$MY_GCP_REGION
ZONE=$MY_GCP_ZONE

CREDENTIALS_FILE="$HOME/.config/gcloud/application_default_credentials.json"
CREDENTIALS_DIR="$HOME/.config/gcloud/tmp_credentials"
TMP_CREDENTIALS_FILE="$CREDENTIALS_DIR/$PROFILE_NAME.json"

# gcloud auth login
function gcloud_login_check() {
  account_list=$(gcloud auth list --format="value(account, status)")

  if ! echo "${account_list}" | grep -q "^${ACCOUNT_NAME}[[:space:]]*\*"; then
    echo " Account: $ACCOUNT_NAME is not active."
    echo "Please login to gcloud."
    gcloud auth login
    # gcloud auth revoke $ACCOUNT_NAME
  else
    echo " Account $ACCOUNT_NAME is active."
  fi
}

# gcloud auth application-default login
function gcloud_application_login_check() {
  if ! output=$(timeout 3 gcloud auth application-default print-access-token 2>&1); then
    echo "$output" 2>&1
    echo " Application login Failed."

    rm -f "$CREDENTIALS_FILE" "$TMP_CREDENTIALS_FILE" # remove symbolic link and file

    echo "Please application login to gcloud."
    gcloud auth application-default login
    # gcloud auth application-default revoke --quiet

    echo " Update credentials file."
    gcloud_credentials_set
  else
    echo " Application login is ok."
  fi
}

# gcloud config set
function gcloud_config_set() {
  gcloud config configurations create "$PROFILE_NAME" > /dev/null 2>&1
  gcloud config set account "$ACCOUNT_NAME" > /dev/null 2>&1
  gcloud config set project "$PROJECT_ID" > /dev/null 2>&1
  gcloud config set compute/region "$RIGION" > /dev/null 2>&1
  gcloud config set compute/zone "$ZONE" > /dev/null 2>&1
  # gcloud config configurations delete "$PROFILE_NAME" --quiet
}

function gcloud_config_set_check() {
  CONFIG_LIST=$(gcloud config configurations list)
  TARGET_PROFILE=$(echo "$CONFIG_LIST" | awk '{print $1}' | grep "$PROFILE_NAME")
  ACTIVE_PROFILE=$(echo "$CONFIG_LIST" | grep 'True' | awk '{print $1}')

  if [[ -z "$TARGET_PROFILE" ]]; then
    echo " Profile $PROFILE_NAME not found."
    rm -f "$CREDENTIALS_FILE" # remove symbolic link
    gcloud_config_set
    echo "Please application login to gcloud."
    gcloud auth application-default login --quiet
    gcloud config set account "$ACCOUNT_NAME" > /dev/null 2>&1
    gcloud config set project "$PROJECT_ID" > /dev/null 2>&1

    return
  else
    echo " Profile $PROFILE_NAME found."
  fi

  if [[ "$ACTIVE_PROFILE" != "$PROFILE_NAME" ]]; then
    echo " Profile $PROFILE_NAME is not active."
    gcloud_credentials_set_check
  else
    echo " Profile $PROFILE_NAME is active."
  fi
}

function gcloud_credentials_set() {
  cp -a "$CREDENTIALS_FILE" "$TMP_CREDENTIALS_FILE"
  ln -sf "$TMP_CREDENTIALS_FILE" "$CREDENTIALS_FILE"
}

function gcloud_credentials_set_check() {
  if [ ! -d "$CREDENTIALS_DIR" ]; then
    mkdir -p "$CREDENTIALS_DIR"
  fi

  rm -f "$CREDENTIALS_FILE" # remove symbolic link

  if [ -e "$TMP_CREDENTIALS_FILE" ]; then
    echo " File $TMP_CREDENTIALS_FILE exists."
    ln -s "$TMP_CREDENTIALS_FILE" "$CREDENTIALS_FILE"
    gcloud config configurations activate "$PROFILE_NAME" > /dev/null 2>&1
  else
    echo " File $TMP_CREDENTIALS_FILE does not exist."
    gcloud config configurations activate "$PROFILE_NAME" > /dev/null 2>&1
    gcloud config set account "$ACCOUNT_NAME" > /dev/null 2>&1
    gcloud config set project "$PROJECT_ID" > /dev/null 2>&1

    echo "Please application login to gcloud."
    gcloud auth application-default login

    gcloud_credentials_set
  fi
}

# main
function main() {
  echo "Enter Project: $PROJECT_ID"
  printf "\n"
  echo "Check configure gcloud."
  gcloud_login_check
  gcloud_config_set_check
  gcloud_application_login_check
  printf "\n"
  gcloud config configurations list
  printf "\n"
  echo Done.
}

main
