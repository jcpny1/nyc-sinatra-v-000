class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |t|
      t.belongs_to :figures
      t.belongs_to :titles
    end
  end
end
