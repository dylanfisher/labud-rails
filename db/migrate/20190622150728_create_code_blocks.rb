class CreateCodeBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :code_blocks do |t|
      t.text :text
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('CodeBlock')
          BlockKind.create name: 'CodeBlock',
                           record_type: 'default',
                           category: 'default',
                           description: 'Add arbitrary blocks of code to a page.'
        end
      end

      change.down do
        BlockKind.where(name: 'CodeBlock').destroy_all
      end
    end
  end
end
