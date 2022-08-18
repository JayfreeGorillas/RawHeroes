//
//  AgentDetailCell.swift
//  RawHeroes
//
//  Created by Josfry Barillas on 8/14/22.
//

import UIKit

class AgentDetailCell: UITableViewCell {
    let agentImage = UIImageView()
    let agentDescriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(agentImage)
        contentView.addSubview(agentDescriptionLabel)
        configureAgentImage()
        configureDescriptionLabel()
        setAgentImageConstraints()
        setDescriptionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAgentImage() {
        agentImage.layer.cornerRadius = 10
        agentImage.clipsToBounds = true
    }
    
    func configureDescriptionLabel() {
        agentDescriptionLabel.numberOfLines = 0
        agentDescriptionLabel.adjustsFontSizeToFitWidth = true
        agentDescriptionLabel.textAlignment = .center
    }
    
    func setAgentImageConstraints() {
        agentImage.translatesAutoresizingMaskIntoConstraints = false
        agentImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        agentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        agentImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        agentImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        agentImage.widthAnchor.constraint(equalTo: agentImage.heightAnchor).isActive = true
    }
    
    func setDescriptionConstraints() {
        agentDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        agentDescriptionLabel.topAnchor.constraint(equalTo: agentImage.bottomAnchor, constant: 10).isActive = true
        agentDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        agentDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        agentDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
