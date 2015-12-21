#!/bin/bash -e

readonly MAX_FILE_DESCRIPTORS=90000
readonly MAX_WATCHERS=524288
readonly MAX_CONNECTIONS=196608
readonly CONNECTION_TIMEOUT=500
readonly ESTABLISHED_CONNECTION_TIMEOUT=86400

update_descriptor_limits() {
  echo "fs.file-max=$MAX_FILE_DESCRIPTORS" | sudo tee -a /etc/sysctl.conf
  echo "*   hard  nofile  $MAX_FILE_DESCRIPTORS" | sudo tee -a /etc/security/limits.conf
  echo "*   soft  nofile  $MAX_FILE_DESCRIPTORS" | sudo tee -a /etc/security/limits.conf
  echo "*   hard  nproc $MAX_FILE_DESCRIPTORS" | sudo tee -a /etc/security/limits.conf
  echo "*   hard  nproc $MAX_FILE_DESCRIPTORS" | sudo tee -a /etc/security/limits.conf
}

update_watchers() {
  echo $MAX_WATCHERS | sudo tee -a /proc/sys/fs/inotify/max_user_watches
  echo "fs.inotify.max_user_watches=$MAX_WATCHERS" | sudo tee -a /etc/sysctl.conf
}

update_network_limits() {
  echo "net.netfilter.nf_conntrack_max=$MAX_CONNECTIONS" | sudo tee -a /etc/sysctl.conf
  echo "net.netfilter.nf_conntrack_generic_timeout=$CONNECTION_TIMEOUT" | sudo tee -a /etc/sysctl.conf
  echo "net.netfilter.nf_conntrack_tcp_timeout_established=$ESTABLISHED_CONNECTION_TIMEOUT" | sudo tee -a /etc/sysctl.conf
}

refresh_settings() {
  sudo sysctl -p 
}

main() {
  update_descriptor_limits
  update_watchers
  update_network_limits
  refresh_settings
}

main
