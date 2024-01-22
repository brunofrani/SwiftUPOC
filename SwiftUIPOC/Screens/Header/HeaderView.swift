//
//  HeaderView.swift
//  WhereToPOC
//
//  Created by Bruno Frani on 19.1.24.
//

import SwiftUI

struct HeaderView: View {
    var account: AccountModel

    var body: some View {

        HStack(alignment: .top) {
            Spacer()
            VStack(alignment: .center, spacing: 10) {

                Text(account.username)
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)

                Image(account.profileImge)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                VStack(spacing: 5) {
                    Text(account.displayName)
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)

                    HStack {
                        Image(account.roleImage)
                            .resizable()
                            .frame(width: 12, height: 12)

                        Text(account.role)
                            .font(Font.system(size: 12))
                            .fontWeight(.semibold)
                    }
                }

                Text(account.description)
                    .font(Font.system(size: 14))
                    .foregroundStyle(Color.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)

                HStack(spacing: 40) {
                    StatisticView(count: account.followers, description: AppStrings.followers)
                    StatisticView(count: account.visits, description: AppStrings.visits)
                    StatisticView(count: account.following, description: AppStrings.following)
                }

                HStack(spacing: 10) {
                    Button {

                    } label: {
                        Text(AppStrings.editProfile)
                            .foregroundStyle(.white)
                            .font(Font.system(size: 14))
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))

                    }
                    .background(.black)
                    .buttonStyle(.bordered)
                    .cornerRadius(12)

                    Button {

                    } label: {
                        Image("3")
                            .resizable()
                            .renderingMode(.template)
                            .colorMultiply(.black.opacity(0.8))
                            .frame(width: 15, height: 15)
                            .padding(2)

                    }

                    .buttonStyle(.bordered)
                    .background(AppColors.lightBackground)
                    .cornerRadius(15)

                }

            }
            Spacer()
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 25, height: 25)
        }

    }
}

#Preview {
    HeaderView(account: AccountModel(username: "bruno_frani99", profileImge: "1", displayName: "Bruno Frani", role: "Enthusiast", roleImage: "2", description: "Hello my name is Bruno and i love to travel and visit | the best restaurants in each city.", followers: 140, visits: 140, following: 140))
}
