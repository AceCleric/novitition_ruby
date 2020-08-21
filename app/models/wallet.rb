class Wallet < ApplicationRecord
  include UuidSupport

  belongs_to :user

  after_update :add_remove_wallet_credit

  def add_remove_wallet_credit
    wallet = Wallet.find(id)

    if remove_credit == 0
      added_credit = credit + add_credit
      wallet.update_columns(credit: added_credit, add_credit: 0)
    else
      removed_credit = credit - remove_credit
      return "No can't do" if removed_credit < 0
      wallet.update_columns(credit: removed_credit, remove_credit: 0)
    end
  end
end
