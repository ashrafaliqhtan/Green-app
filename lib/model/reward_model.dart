class RewardModel {
  String? rewardId;
  String? rewardName;
  String? rewardCompanyLogo;
  String? rewardContent;
  String? rewardCompanyName;
  String? rewardImage;

  RewardModel(
      {this.rewardId,
      this.rewardName,
      this.rewardCompanyLogo,
      this.rewardContent,
      this.rewardCompanyName,
      this.rewardImage});

  RewardModel.fromJson(Map<String, dynamic> json) {
    rewardId = json['reward_id'];
    rewardName = json['reward_name'];
    rewardCompanyLogo = json['reward_company_logo'];
    rewardContent = json['reward_content'];
    rewardCompanyName = json['reward_company_name'];
    rewardImage = json['reward_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reward_id'] = this.rewardId;
    data['reward_name'] = this.rewardName;
    data['reward_company_logo'] = this.rewardCompanyLogo;
    data['reward_content'] = this.rewardContent;
    data['reward_company_name'] = this.rewardCompanyName;
    data['reward_image'] = this.rewardImage;
    return data;
  }
}
