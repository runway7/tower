class Key < ActiveRecord::Base
  belongs_to :account
  validates_uniqueness_of :uid
  validates_presence_of :name

  before_save :ensure_keys_are_set

  def token
    "#{uid}#{secret}".gsub '-',''
  end

  private

  def ensure_keys_are_set
    if uid.blank? or secret.blank?
      self.uid = SecureRandom.uuid.gsub '-',''
      self.secret = Digest::SHA256.new.update(SecureRandom.hex(256)).hexdigest
    end
  end

end
