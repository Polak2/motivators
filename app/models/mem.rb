class Mem < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :image, :styles => {:large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true

  after_validation(on: :create) do
  	self.active = false
  end

  #mogloby byc tez
  #=begin

  #after_validation :set_active, on: :create
  #def set_active
  # self.active = false
  #end	

  #=end


  scope :active, -> { where active: true }
  scope :inactive, -> { where active: false }


  #ta metoda wykorzystywana jest w show.html.erb
  #w miejscu <%= @mem.tag_list %>
  def tag_list
    #tags sie bierze z asocjacji
    tags.map { |t| t.name }.join(",")
  end
  
  #(dupa) wpisuje/bierze sie z formularza bo po zakomentowaniu
  #ponizszej metody mam blad "unknown attribute tag_list"
  #nazwa parametru dowolna
  def tag_list=(dupa)
    #dupa jest to string z formularza, ktory obrabiamy nizej
    tag_names = dupa.split(",") #dzieli string wg znaku "," na tablice substringow, np. "dupa, dupa_blada".split(",") zrobi ["dupa", "dupa_blada"]
    dupa2 = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    #ponizsze tags z asocjacji, dupa2 to tablica z obrobionymi tagami, self.tags jest prawdopodobnie wykorzystywane w metodzie tag_list wyzej (ta pierwsza)
    self.tags = dupa2
  end

end
