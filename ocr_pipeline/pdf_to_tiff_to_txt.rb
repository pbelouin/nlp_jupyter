all_pdfs = Dir["*.pdf"]

all_pdfs.each do |pdf|
  name = pdf.split('.')[0]
  system("convert -density 300 './#{name}.pdf' -depth 8 #{name}.tiff")
  system("tesseract -l deu #{name}.tiff #{name}")
end





