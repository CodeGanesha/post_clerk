require "spec_helper"

RSpec.describe OfficeClerk::Post do

  subject { OfficeClerk::ShippingMethod.all.first }

  context 'returns description' do
    %w(en fi).each do |locale|
      it "in supported language: #{locale}" do
        I18n.with_locale(locale.to_sym) do
          OfficeClerk::ShippingMethod.all.each do |name , method|
            expect(method.description).not_to be_blank
            expect(method.description).not_to include("missing")
          end
        end
      end
    end
  end

end
