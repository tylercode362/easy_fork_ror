require "google/cloud/storage"

namespace :assets do
  desc "asstes sync"
  task :gcs_upload => :environment do
    
    storage = Google::Cloud::Storage.new(
      project_id: Cfg["GCP"]["PROJECT_ID"],
      credentials: Cfg["GCP"]["CREDENTIALS"]
    )

    bucket = storage.bucket Cfg["GCP"]["GCS"]["BUCKET"]
    
    manifest = JSON.parse File.read(File.join(Rails.root, "public/assets/manifestjson"))

    manifest.each do | name, path |
        next unless bucket.file(path).nil?
        remote_file_path = "webpack/"
        local_file_path = File.join(Rails.root, "public", path)

    end
  end
end