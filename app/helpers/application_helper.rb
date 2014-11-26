module ApplicationHelper
  def states_options
    return [
      ['Alaska', 'AK'],
      ['Alabama', 'AL'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Lousiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Virginia', 'VA'],
      ['Vermont', 'VT'],
      ['Washington', 'WA'],
      ['Wisconsin', 'WI'],
      ['West Virigina', 'WV'],
      ['Wyoming', 'WY']
    ]
  end
  def affirmative_options
    return [
      ["Yes", "Yes"],
      ["No", "No"]
    ]
  end
  def confident_options
    return [
      ["Likely", "Likely"],
      ["Target", "Target"],
      ["Stretch", "Stretch"],
      ["High Stretch", "High Stretch"],
      ["Not Applicable", "Not Applicable"]
    ]
  end
end
