# gcloud settings

if test -f "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
	status is-interactive; and source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
end
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True
