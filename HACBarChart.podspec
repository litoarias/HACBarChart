Pod::Spec.new do |s|
  s.name         = "HACBarChart"
  s.version      = "0.0.7"
  s.summary      = "Easy bar chart"
  s.description  = <<-DESC
	Simple and dynamic bar graph, very easy setup and operation.
    DESC
  s.homepage         = "https://github.com/litoarias/HACBarChart.git"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.authors          = { "litoarias" => "lito.arias.cervero@gmail.com" }
  s.social_media_url = 'https://github.com/litoarias/HACBarChart'
  s.platform         = :ios, "7.0"
  s.source           = { :git => "https://github.com/litoarias/HACBarChart.git", :tag => "0.0.7" }
  s.source_files     = "HACBarChart"
  s.requires_arc     = true

end
