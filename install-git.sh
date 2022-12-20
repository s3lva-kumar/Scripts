#!/usr/bin/env bash
  git --version &> /dev/null
  if [[ $? -eq 0 ]]; then
    echo "git already installed"

  elif [[ has_apt_get ]]; then
    sudo add-apt-repository ppa:git-core/ppa && sudo apt update
    sudo apt-get install git -y

  elif [[ has_yum ]]; then
    sudo yum update -y ; sudo yum install git -y

  else
    fatal "Could not find apt-get, yum. Cannot install git on this OS."
      exit 1
  fi

