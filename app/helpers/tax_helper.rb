# app/helpers/tax_helper.rb
module TaxHelper
  def tax_rates_for(province)
    case province
    when 'MB' then { gst: 0.05, pst: 0.07, hst: 0.00 }
    when 'ON' then { gst: 0.00, pst: 0.00, hst: 0.13 }
    when 'NS' then { gst: 0.00, pst: 0.00, hst: 0.15 }
    else { gst: 0.05, pst: 0.0, hst: 0.0 }
    end
  end
end