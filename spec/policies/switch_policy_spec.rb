require 'rails_helper'

RSpec.describe SwitchPolicy do
  subject { SwitchPolicy.new(user, switch) }

  let(:switch) { create(:switch) }

  context "When a commun user access the app" do
    let(:user) { create(:user, account: switch.account) }

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context('When the user is an account owner') do
    context('and the account switch is diferent to account user')do
      let(:user) { create(:user, owner: true) }

      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    context('and the account switch is the same of account user')do
      let(:user) {
        create(:user, account: switch.account, owner: true)
      }

      it { is_expected.to permit_action(:index) }
      it { is_expected.to permit_action(:show) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to permit_action(:update) }
      it { is_expected.to permit_action(:edit) }
      it { is_expected.to permit_action(:destroy) }
    end
  end
end
