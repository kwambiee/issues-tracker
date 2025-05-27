WickedPdf.config ||= {}
WickedPdf.config.merge!({
  layout: 'pdf.html.erb',
  orientation: 'Portrait',
  lowquality: true,
  zoom: 1,
  dpi: 75
})