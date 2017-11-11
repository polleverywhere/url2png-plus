RSpec.describe Url2png::Plus do
  it "has a version number" do
    expect(Url2png::Plus::VERSION).not_to be nil
  end

  subject { Url2png::Plus::Client.new(api_key: api_key, secret: secret) }
  let(:api_key) { "APIKEY" }
  let(:secret) { "SECRET" }
  it "generates basic url2png URL" do
    expect(subject.url("https://www.example.com/rabit.png").to_s).to eql(%[https://api.url2png.com/v6/APIKEY/997ae32c145635e4ec1c2ba684ce2949/png/?url=https%3A%2F%2Fwww.example.com%2Frabit.png])
  end
  it "generates advanced url2png URL" do
    expect(subject.url("https://www.example.com/rabit.png", viewport: "100x100", fullpage: true).to_s).to eql(%[https://api.url2png.com/v6/APIKEY/39a53c5abd1af32ce635d6fab751c5d3/png/?viewport=100x100&fullpage=true&url=https%3A%2F%2Fwww.example.com%2Frabit.png])
  end
end
