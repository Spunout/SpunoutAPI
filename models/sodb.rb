module SpunoutAPI
  
  class SoDB
    
    def initialize
      @select_string = "SELECT exp_channel_titles.title, 
            exp_channel_titles.entry_id, 
            exp_channel_titles.url_title,
            exp_channel_data.field_id_23, 
            exp_channel_data.field_id_24, 
            exp_channel_data.field_id_25, 
            exp_channel_data.field_id_26, 
            exp_channel_data.field_id_27, 
            exp_channel_data.field_id_28, 
            exp_channel_data.field_id_29, 
            exp_channel_data.field_id_30, 
            exp_channel_data.field_id_31, 
            exp_channel_data.field_id_32, 
            exp_channel_data.field_id_33, 
            exp_channel_data.field_id_34, 
            exp_channel_data.field_id_35, 
            exp_channel_data.field_id_36, 
            exp_channel_data.field_id_37, 
            exp_channel_data.field_id_85
      FROM exp_channel_titles
      LEFT JOIN exp_channel_data on exp_channel_titles.entry_id = exp_channel_data.entry_id "
  
      @client = Mysql2::Client.new(:host => "127.0.0.1", :username => "root", :database => "spunout", :password => "root")  
    
    end

      
    
    def page(page)
      
      if(page == 0) 
        self.query("LIMIT 50 OFFSET 0")
      else 
        self.query("LIMIT 50 OFFSET "+(page * 50).to_s)
      end
      
    end
    
    def find_by_id(id)
      self.query("WHERE exp_channel_titles.entry_id = "+id)
    end
    
    def find(term)
      self.query("WHERE
                  (
                      exp_channel_titles.title LIKE '%"+term+"%'
                      or exp_channel_data.field_id_23 LIKE '%"+term+"%'
                      or exp_channel_data.field_id_26 LIKE '%"+term+"%'
                      or exp_channel_data.field_id_28 LIKE '%"+term+"%'
                      or exp_channel_data.field_id_37 LIKE '%"+term+"%'
                  )
                  AND exp_channel_titles.channel_id = 5 ")
    end
    
    def query(where)
      response = []
      results = @client.query(@select_string+where)
      results.each do |row|
        
        image_url = ""
        if !row['field_id_85'].empty? 
          image_url = row['field_id_85']
          image_url['{filedir_5}'] = "http://spunout.ie/images/services/"
        end
        
        response.push( { 
                        :id => row['entry_id'], 
                        :title => row['title'], 
                        :info => row['field_id_23'].empty? ? nil : row['field_id_23'],
                        :page =>  "http://spunout.ie/help/service/"+row['url_title'],
                        :address => {
                          :lines => [ 
                                      row['field_id_24'].empty? ? nil : row['field_id_24'],
                                      row['field_id_25'].empty? ? nil : row['field_id_25']
                                    ],
                          :city => row['field_id_26'].empty? ? nil : row['field_id_26'],
                          :postcode => row['field_id_27'].empty? ? nil : row['field_id_27'],
                          :county => row['field_id_28'].empty? ? nil : row['field_id_28'],
                          :country => row['field_id_29'].empty? ? nil : row['field_id_29'],
                          :latitude => row['field_id_35'].empty? ? nil : row['field_id_35'],
                          :longitude => row['field_id_36'].empty? ? nil : row['field_id_36'],
                        },
                        :website => row['field_id_30'].empty? ? nil : row['field_id_30'],
                        :email => row['field_id_31'].empty? ? nil : row['field_id_31'],
                        :phone => row['field_id_32'].empty? ? nil : row['field_id_32'],
                        :hotline => row['field_id_33'].empty? ? nil : row['field_id_33'],
                        :hours => row['field_id_34'].empty? ? nil : row['field_id_34'],
                        :keywords => row['field_id_37'].empty? ? nil : row['field_id_37'],
                        :image => image_url.empty? ? nil : image_url
                        } )
      end
      response
    end
    
  end
  
end