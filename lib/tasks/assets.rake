require "google/cloud/storage"

namespace :assets do
  desc "asstes sync"
  task :sync_gcs=> :environment do
    storage = Google::Cloud::Storage.new(
      project_id: Cfg["GCP"]["PROJECT_ID"],
      credentials: Cfg["GCP"]["GCS"]["CREDENTIALS"]
    )

    bucket = storage.bucket Cfg["GCP"]["GCS"]["BUCKET"]
    
    manifest = JSON.parse File.read(File.join(Rails.root, "public/assets/manifest.json"))

    manifest.each do | name, path |
        remote_file_path = File.join("webpack", path)
        next unless bucket.file(remote_file_path).nil?
        local_file_path = File.join(Rails.root, "public", path)
        result = bucket.create_file(local_file_path, remote_file_path, acl: "public")
    end
  end
end