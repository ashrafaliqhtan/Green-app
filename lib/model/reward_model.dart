class RewardModel {
  String? rewardId;
  String? rewardName;
  String? rewardCompanyLogo;
  String? rewardContent;
  String? rewardCompanyName;

  RewardModel(
      {this.rewardId,
      this.rewardName,
      this.rewardCompanyLogo,
      this.rewardContent,
      this.rewardCompanyName,});

  RewardModel.fromJson(Map<String, dynamic> json) {
    rewardId = json['reward_id'];
    rewardName = json['reward_name'];
    rewardCompanyLogo = json['reward_company_logo'];
    rewardContent = json['reward_content'];
    rewardCompanyName = json['reward_company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reward_id'] = this.rewardId;
    data['reward_name'] = this.rewardName;
    data['reward_company_logo'] = this.rewardCompanyLogo;
    data['reward_content'] = this.rewardContent;
    data['reward_company_name'] = this.rewardCompanyName;
    return data;
  }
}
