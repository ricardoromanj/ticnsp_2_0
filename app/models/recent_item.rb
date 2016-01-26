class RecentItem < ActiveRecord::Base
  belongs_to :visitor, class_name: 'User'
  belongs_to :recentable, polymorphic: true

  scope :latest, -> { order( created_at: :desc ).limit(13) }
  scope :full_history, -> { order( created_at: :desc ) }

  before_create :check_dupe

  def human_recentable
    if recentable.class == User
      { text: recentable.full_name, icon: 'fa fa-user', color: 'gray' }
    elsif recentable.class == Child
      { text: recentable.full_name, icon: 'fa fa-child', color: 'aqua' }
    elsif recentable.class == Workshop
      { text: "Taller #{ recentable.name }", icon: 'fa fa-graduation-cap', color: 'green' }
    elsif recentable.class == Lecture
      { text: "Catequesis #{ recentable.name }", icon: 'ion ion-ios-bookmarks', color: 'red' }
    elsif recentable.class == Commission
      { text: "Comisión #{ recentable.name }", icon: 'fa fa-flag', color: 'orange' }
    elsif recentable.class == Shepperding
      { text: "Acomp. #{ recentable.name }", icon: 'fa fa-flag', color: 'purple' }
    end
  end

  private
    def check_dupe
      temp = RecentItem.where( visitor: visitor ).last
      !( temp.recentable == recentable ) if temp
    end
end
