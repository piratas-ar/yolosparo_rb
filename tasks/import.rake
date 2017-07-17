task :import => :environment do
  require 'open-uri'
  require 'securerandom'

  Dir['db/import/*.json'].each do |file|
    legicats = JSON.parse(File.open(file).read)

    # Evitamos usar type como campo
    legicats.collect do |l|
      l['legi_type'] = l.delete('type')

      name = l['user_name'] || SecureRandom.hex

      dir    = File.join('images', l['legi_type'])
      file   = File.join(dir, "#{name}.#{l['picture_url'].split('.').last}")
      dlocal = File.join('public', dir)
      local  = File.join('public', file)
      url    = File.join('/', file)

      unless File.exists? local
        FileUtils.mkdir_p dlocal
        puts "Descargando #{name}"
        IO.copy_stream(open(l['picture_url']), local)
      end

      l['picture_url'] = url

      Legi.create(l)
    end
  end

end
