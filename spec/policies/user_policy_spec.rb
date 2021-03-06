require 'rails_helper'

RSpec.describe UserPolicy do
  subject { UserPolicy.new(user, user2) }

  let(:user2) { create(:user) }

  context "When a commun user access the app" do
    let(:user) { create(:user, account: user2.account) }

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:create) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context('When the user is an account owner') do
    context('and the account user2 is diferent to account curren_user')do
      let(:user) { create(:user, owner: true) }

      it { is_expected.to permit_action(:index) }
      it { is_expected.to forbid_action(:show) }
      it { is_expected.to permit_action(:create) }
      it { is_expected.to permit_action(:new) }
      it { is_expected.to forbid_action(:update) }
      it { is_expected.to forbid_action(:edit) }
      it { is_expected.to forbid_action(:destroy) }
    end

    context('and the account user2 is the same of account curren_user')do
      let(:user) {
        create(:user, account: user2.account, owner: true)
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
